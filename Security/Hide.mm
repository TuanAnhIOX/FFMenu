#include <mach-o/dyld.h>
#include <dlfcn.h>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include "fishhook.h"

#pragma mark - Hide Dylib




#pragma mark - SSL Certificate Pinning Bypass


typedef struct ssl_st SSL;


long (*orig_SSL_get_verify_result)(SSL *ssl);
long fake_SSL_get_verify_result(SSL *ssl) {
    return 0; // Always valid certificate
}



__attribute__((constructor))
void init_basic_bypass() {
    hide_dylib("vh.dylib");

    struct rebinding rebs[] = {
        {"access", (void *)fake_access, (void **)&orig_access},
        {"send", (void *)fake_send, (void **)&orig_send},
        {"SSL_get_verify_result", (void *)fake_SSL_get_verify_result, (void **)&orig_SSL_get_verify_result}
    };
    rebind_symbols(rebs, 3);
}











void hide_dylib(const char* name) {
    uint32_t count = _dyld_image_count();
    for (uint32_t i = 0; i < count; i++) {
        const char* img = _dyld_get_image_name(i);
        if (img && strstr(img, name)) {
            memset((void*)img, 0, strlen(img)); // zero out path
        }
    }
}

#pragma mark - Block Root/Emulator Detection

int (*orig_access)(const char *, int);
int fake_access(const char *pathname, int mode) {
    if (pathname && (strstr(pathname, "su") || strstr(pathname, "magisk") || strstr(pathname, "xposed"))) {
        return -1;
    }
    return orig_access(pathname, mode);
}

#pragma mark - Block Reporting

ssize_t (*orig_send)(int, const void *, size_t, int);
ssize_t fake_send(int sockfd, const void *buf, size_t len, int flags) {
    return 0; // Block all send traffic
}

#pragma mark - Init

__attribute__((constructor))
void init_basic_bypass() {
    hide_dylib("Zexis.dylib"); 

    struct rebinding rebs[] = {
        {"access", (void *)fake_access, (void **)&orig_access},
        {"send", (void *)fake_send, (void **)&orig_send}
    };
    rebind_symbols(rebs, 2);
}
