# SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#
# SPDX-License-Identifier: EPICS

TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = mm4006
# mm4006.dbd will be created and installed
DBD += mm4006.dbd

# mm4006.dbd will be made up from these files:
mm4006_DBD += base.dbd

# Include dbd files from all support applications:
#mm4006_DBD += xxx.dbd
mm4006_DBD += stream-base.dbd
mm4006_DBD += drvAsynIPPort.dbd
mm4006_DBD += asyn.dbd
mm4006_DBD += calc.dbd

# Add all the support libraries needed by this IOC
#mm4006_LIBS += xxx
mm4006_LIBS += stream
mm4006_LIBS += asyn
mm4006_LIBS += calc

# mm4006_registerRecordDeviceDriver.cpp derives from mm4006.dbd
mm4006_SRCS += mm4006_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
mm4006_SRCS_DEFAULT += mm4006Main.cpp
mm4006_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#mm4006_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file

ifneq ($(SNCSEQ),)
	mm4006_SNCFLAGS += +r
	mm4006_DBD += sncmm4006.dbd
	mm4006_SRCS += mm4006.stt
	mm4006_SRCS += motor_status.c
	mm4006_SRCS += res_utils.c
	mm4006_LIBS += seq pv
endif


# Link QSRV (pvAccess Server) if available
ifdef EPICS_QSRV_MAJOR_VERSION
	mm4006_LIBS += qsrv
	mm4006_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
	mm4006_DBD += PVAServerRegister.dbd
	mm4006_DBD += qsrv.dbd
endif

# Finally link to the EPICS Base libraries
mm4006_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

