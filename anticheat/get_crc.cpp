// get_crc.cpp
#include "anticheat/anticheat.h"
#include <iostream>

int main() {
    std::cout << "Valid CRC: 0x" << std::hex 
              << AntiCheat::CalculateCRC() << std::endl;
    return 0;
}
