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

PROD_IOC = mm4006IOC
# mm4006IOC.dbd will be created and installed
DBD += mm4006IOC.dbd

# mm4006IOC.dbd will be made up from these files:
mm4006IOC_DBD += base.dbd

# Include dbd files from all support applications:
#mm4006IOC_DBD += xxx.dbd
mm4006IOC_DBD += stream-base.dbd
mm4006IOC_DBD += drvAsynIPPort.dbd
mm4006IOC_DBD += asyn.dbd
mm4006IOC_DBD += calc.dbd

# Add all the support libraries needed by this IOC
#mm4006IOC_LIBS += xxx
mm4006IOC_LIBS += stream
mm4006IOC_LIBS += asyn
mm4006IOC_LIBS += calc

# mm4006IOC_registerRecordDeviceDriver.cpp derives from mm4006IOC.dbd
mm4006IOC_SRCS += mm4006IOC_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
mm4006IOC_SRCS_DEFAULT += mm4006IOCMain.cpp
mm4006IOC_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#mm4006IOC_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link QSRV (pvAccess Server) if available
ifdef EPICS_QSRV_MAJOR_VERSION
    mm4006IOC_LIBS += qsrv
    mm4006IOC_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    mm4006IOC_DBD += PVAServerRegister.dbd
    mm4006IOC_DBD += qsrv.dbd
endif

# Finally link to the EPICS Base libraries
mm4006IOC_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

