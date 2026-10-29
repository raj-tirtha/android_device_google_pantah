#
# SPDX-FileCopyrightText: 2020 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt
TARGET_BOOTLOADER_BOARD_NAME := $(DEVICE_CODENAME)
TARGET_SCREEN_DENSITY := 560

# SEPolicy
BOARD_VENDOR_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy/$(DEVICE_CODENAME)/vendor

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy/$(DEVICE_CODENAME)/system_ext/private

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy/$(DEVICE_CODENAME)/system_ext/public

include $(DEVICE_PATH)/BoardConfigCommon.mk

include $(VENDOR_PATH)/BoardConfigVendor.mk

# Penguin OS (AOSPA) lacks LineageOS's add-radio-file-sha1-checked helper,
# used by the vendor Android.mk to bundle firmware images. Map it to AOSP's.
define add-radio-file-sha1-checked
$(call add-radio-file,$(1))
endef
