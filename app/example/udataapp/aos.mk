NAME := udataapp

$(NAME)_MBINS_TYPE := app
$(NAME)_VERSION := 1.0.0
$(NAME)_SUMMARY := uData sensor framework demo

$(NAME)_SOURCES :=   udata_example.c
$(NAME)_COMPONENTS := cli sensor udata

GLOBAL_INCLUDES += ./

ifeq ($(AOS_CONFIG_DTC_LINKKIT),y)

$(NAME)_SOURCES += linkkit/app_entry.c
$(NAME)_SOURCES += linkkit/linkkit_example_solo.c

$(NAME)_COMPONENTS += linkkit_sdk_c yloop netmgr cjson


LWIP ?= 1
ifeq ($(LWIP),1)
$(NAME)_COMPONENTS  += lwip
no_with_lwip := 0
endif

GLOBAL_INCLUDES += ./
GLOBAL_DEFINES += DTC_LINKKIT

else ifeq ($(AOS_CONFIG_DTC_MQTT),y)

$(NAME)_SOURCES    += mqtt/mqtt_example.c

$(NAME)_COMPONENTS += netmgr yloop linkkit_sdk_c
GLOBAL_DEFINES     += USE_LPTHREAD

GLOBAL_DEFINES     += DTC_MQTT
endif
