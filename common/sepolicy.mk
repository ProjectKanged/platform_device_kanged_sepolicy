#
# This policy configuration will be used by all products that
# inherit from Lineage
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    device/kanged/sepolicy/common/public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/kanged/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/kanged/sepolicy/common/dynamic \
    hardware/google/pixel-sepolicy/flipendo \
    hardware/google/pixel-sepolicy/turbo_adapter
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/kanged/sepolicy/common/dynamic \
    device/kanged/sepolicy/common/vendor \
    hardware/google/pixel-sepolicy/flipendo \
    hardware/google/pixel-sepolicy/turbo_adapter
endif
