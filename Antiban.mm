
#include <dlfcn.h>
#include <unistd.h>
#include <sys/sysctl.h>
#include <Security/SecureTransport.h>
#include "fishhook.h"

// Declare ptrace manually since we're on jailed iOS
#ifndef PT_DENY_ATTACH
#define PT_DENY_ATTACH 31
#endif

typedef char* caddr_t;
extern "C" int ptrace(int request, pid_t pid, caddr_t addr, int data);

// Forward declaration for SSL
struct SSL;

// Fake functions to bypass anti-debugging and SSL checks
int fake_ptrace(int _request, pid_t _pid, caddr_t _addr, int _data) {
    return -1;
}

int fake_sysctl(int *name, u_int namelen, void *oldp, size_t *oldlenp, void *newp, size_t newlen) {
    if (namelen == 4 && name[0] == CTL_KERN && name[1] == KERN_PROC && name[2] == KERN_PROC_PID) {
        return -1;
    }
    // Fall back to original if needed
    return sysctl(name, namelen, oldp, oldlenp, newp, newlen);
}

long fake_SSL_get_verify_result(struct SSL *ssl) {
    return 0; // Always verified
}

void fake_exit(int status) {
    return; // Prevent exit()
}

__attribute__((constructor))
static void init_antiban() {
    // Hook system functions using fishhook
    rebind_symbols((struct rebinding[4]){
        {"ptrace", (void *)fake_ptrace, NULL},
        {"sysctl", (void *)fake_sysctl, NULL},
        {"SSL_get_verify_result", (void *)fake_SSL_get_verify_result, NULL},
        {"exit", (void *)fake_exit, NULL}
    }, 4);
}
