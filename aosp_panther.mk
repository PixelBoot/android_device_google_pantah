#
# Copyright 2021 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_LINUX_KERNEL_VERSION := 5.10

USE_SWIFTSHADER := true
BOARD_USES_SWIFTSHADER := true

$(call inherit-product, device/google/gs201/aosp_common.mk)
$(call inherit-product, device/google/pantah/device-panther.mk)

$(call inherit-product, vendor/pb/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/pantah/aosp_panther.mk)
$(call inherit-product, device/google/gs201/custom_common.mk)

include device/google/pantah/panther/device-custom.mk

PRODUCT_NAME := aosp_panther
PRODUCT_DEVICE := panther
PRODUCT_MODEL := Pixel 7
PRODUCT_BRAND := google
PRODUCT_MANUFACTURER := Google

DEVICE_MANIFEST_FILE := \
	device/google/pantah/manifest.xml

# Keep the VNDK APEX in /system partition for REL branches as these branches are
# expected to have stable API/ABI surfaces.
ifneq (REL,$(PLATFORM_VERSION_CODENAME))
  PRODUCT_PACKAGES += com.android.vndk.current.on_vendor
endif

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=panther

$(call inherit-product, vendor/google/panther/panther-vendor.mk)
