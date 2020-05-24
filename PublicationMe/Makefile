ARCHS = arm64 armv7 armv7s
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = PublicationForMe
PublicationForMe_FILES = Tweak.x
PublicationForMe_CFLAGS = -fobjc-arc
PublicationForMe_PRIVATE_FRAMEWORKS = BulletinBoard

TOOL_NAME = publicationme
publicationme_FILES = main.m
publicationme_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/tool.mk
