#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: Paranoid Android
# SPDX-License-Identifier: Apache-2.0
#

ifeq (aospa_panther,$(TARGET_PRODUCT))

# Inherit device configuration
DEVICE_CODENAME := panther
DEVICE_PATH := device/google/pantah
VENDOR_PATH := vendor/google/panther
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)

# Enable Penguin OS blur (sets ro.custom.blur.enable)
TARGET_USES_BLUR := true

# Inherit Penguin OS (AOSPA) configuration
$(call inherit-product, vendor/aospa/target/product/aospa-target.mk)

# ViPER4Android FX
$(call inherit-product, packages/apps/ViPER4AndroidFX/config.mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_DEVICE := $(DEVICE_CODENAME)
PRODUCT_MANUFACTURER := Google
PRODUCT_MODEL := Pixel 7
PRODUCT_NAME := aospa_$(DEVICE_CODENAME)

PRODUCT_GMS_CLIENTID_BASE := android-google

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildFingerprint=google/panther/panther:17/CP3A.261005.002.A1/16269273:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

# Penguin OS installs extras in /system; skip the GSI artifact path check
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := false

# Broadcom Wi-Fi config still uses the Android.mk wpa_supplicant.conf
FORCE_USE_ANDROIDMK_FOR_WPA_CONF := true

TARGET_PREBUILT_KERNEL := device/google/pantah-kernels/6.12/Image.lz4
# Boot animation resolution
TARGET_BOOT_ANIMATION_RES := 1080

# Penguin OS overlays (maintainer name)
PRODUCT_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay-penguin

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)

endif
