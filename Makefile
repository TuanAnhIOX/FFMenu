export THEOS = /var/mobile/theos
export CC = ccache gcc
export CXX = ccache g++
ARCHS = arm64


DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1
THEOS_PACKAGE_SCHEME = rootless
THEOS_LEAN_AND_MEAN = 1
THEOS_NO_DEFAULTS = 1
#TARGET = iphone:clang:16.5:16.5


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Zexis
$(TWEAK_NAME)_CCFLAGS = -std=c++17 -fno-rtti -DNDEBUG -Wall -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value -Wno-unused-function -fvisibility=hidden

$(TWEAK_NAME)_CCFLAGS += -x objective-c++

$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wall -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value -Wno-unused-function -fvisibility=hidden -w 

ifeq ($(IGNORE_WARNINGS),1)
  $(TWEAK_NAME)_CFLAGS += -w
  $(TWEAK_NAME)_CCFLAGS += -w
endif
$(TWEAK_NAME)_FRAMEWORKS =  UIKit Foundation Security QuartzCore CoreGraphics CoreText  AVFoundation Accelerate GLKit SystemConfiguration GameController
$(TWEAK_NAME)_FILES = ImGuiDrawView.mm $(wildcard Esp/*.mm) $(wildcard Esp/*.m) $(wildcard IMGUI/*.cpp) $(wildcard IMGUI/*.mm) $(wildcard Antiban.mm) $(wildcard fishhook.c) $(wildcard Security/hide.mm) $( wildcard Helper/aimkill.cpp)  $(wildcard antiban/*.c)

include $(THEOS_MAKE_PATH)/tweak.mk