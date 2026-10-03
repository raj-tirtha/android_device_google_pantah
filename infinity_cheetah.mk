#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Infinity X flags (set before inheriting the common config)
INFINITY_MAINTAINER := "raj-tirtha"
TARGET_HAS_UDFPS := true
WITH_GAPPS := true

# LineageOS base version, used by the kernel source sync
PRODUCT_VERSION_MAJOR := 24
PRODUCT_VERSION_MINOR := 0

# Inherit some common Infinity X stuff
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

# Inherit device configuration
DEVICE_CODENAME := cheetah
DEVICE_PATH := device/google/pantah
VENDOR_PATH := vendor/google/cheetah
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)

# ViPER4Android FX
$(call inherit-product, packages/apps/ViPER4AndroidFX/config.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := infinity_$(DEVICE_CODENAME)
PRODUCT_SYSTEM_BRAND := google
PRODUCT_SYSTEM_MANUFACTURER := Google
PRODUCT_SYSTEM_NAME := generic_system_google

# Boot animation
TARGET_SCREEN_HEIGHT := 3120
TARGET_SCREEN_WIDTH := 1440

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="cheetah-user 17 CP2A.260705.006 15641320 release-keys" \
    BuildFingerprint=google/cheetah/cheetah:17/CP2A.260705.006/15641320:user/release-keys \
    BuildSystemFingerprint=google/generic_system_google/generic:17/CP2A.260705.006/15641320:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)

# Allow Infinity X / GApps files in /system despite generic_system.mk's path requirements
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/apex/com.google.android.extservices.apex \
    system/app/GoogleExtShared/GoogleExtShared.apk \
    system/app/GooglePrintRecommendationService/GooglePrintRecommendationService.apk \
    system/lib/libtensorflowlite_jni.so \
    system/lib64/libtensorflowlite_gpu_jni.so \
    system/lib64/libtensorflowlite_jni.so \
    system/priv-app/OmniStyle/OmniStyle.apk \
    system/priv-app/TagGoogle/TagGoogle.apk
