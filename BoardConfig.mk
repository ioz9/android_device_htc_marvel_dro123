# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

### Camera
# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := false
BOARD_USE_FROYO_LIBCAMERA := true
#BOARD_CAMERA_USE_GETBUFFERINFO := true

### Provide missing header files
TARGET_SPECIFIC_HEADER_PATH := device/htc/marvel/include

### Board config
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_BOARD_PLATFORM := msm7x27
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi

### Bootloader
TARGET_BOOTLOADER_BOARD_NAME := marvel
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

### Kernel related stuff
BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null
BOARD_KERNEL_BASE := 0x12c00000
BOARD_KERNEL_PAGESIZE := 2048
LOCAL_KERNEL := device/htc/marvel/prebuilt/kernel
TARGET_PREBUILT_KERNEL := device/htc/marvel/prebuilt/kernel
TARGET_RECOVERY_INITRC := device/htc/marvel/init.recovery.rc

### Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := bcm4329
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/firmware/fw_bcm4329.bin nvram_path=/proc/calibration"
WIFI_DRIVER_MODULE_NAME     := "bcm4329"

### Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

### Audio
# http://arunraghavan.net/2012/01/pulseaudio-vs-audioflinger-fight/
BOARD_USES_GENERIC_AUDIO := false

### FM radio
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
BOARD_VENDOR_USE_AKMD := akm8975

### Graphics
# http://www.slideshare.net/jserv/design-and-concepts-of-android-graphics
# See https://github.com/CyanogenMod/android_frameworks_base/commit/fc496c0607d0d2863ff9587019e890ab806ea49d
# Remove if we have 3.0 kernel
COMMON_GLOBAL_CFLAGS += -DEGL_TRACE \
			-DQCOM_HARDWARE \
			-DMISSING_EGL_EXTERNAL_IMAGE \
			-DMISSING_EGL_PIXEL_FORMAT_YV12 \
			-DMISSING_GRALLOC_BUFFERS

USE_OPENGL_RENDERER := true
TARGET_USES_GENLOCK := true
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true
BOARD_USES_QCOM_HARDWARE := true
BOARD_VENDOR_QCOM_AMSS_VERSION := 4735
BOARD_CUSTOM_GRAPHICS := ../../../device/htc/marvel/recovery/graphics.c
BOARD_EGL_CFG := vendor/htc/marvel/proprietary/etc/egl.cfg

### Touchscreen
# Allow compatibility with 'old' Touchscreens (Linux < 3.1)
#
# Remember to add the new idc file required for the touchscreen/keypad
# Example: /system/usr/idc/qtouch-touchscreen.idc
#
# http://review.cyanogenmod.com/#change,10354
BOARD_USE_LEGACY_TOUCHSCREEN := true

### Browser
JS_ENGINE:=v8

### GPS
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_GPS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := marvel
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 20000

### RIL
BOARD_USE_NEW_LIBRIL_HTC := true

# # cat /proc/mtd (marvel)
#dev:    size   erasesize  name
#mtd0: 00100000 00040000 "misc"
#mtd1: 00500000 00040000 "recovery"
#mtd2: 00340000 00040000 "boot"
#mtd3: 10400000 00040000 "system"
#mtd4: 02300000 00040000 "cache"
#mtd5: 09600000 00040000 "userdata"
#mtd6: 00a00000 00040000 "devlog"

### Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00340000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x10400000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x09600000
BOARD_FLASH_BLOCK_SIZE := 262144

### Other
TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
DISABLE_DEXPREOPT := true