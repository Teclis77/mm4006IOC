#!../../bin/linux-x86_64/mm4006IOC

#- SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#-
#- SPDX-License-Identifier: EPICS

#- You may have to change mm4006IOC to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

epicsEnvSet ("STREAM_PROTOCOL_PATH", "${TOP}/db")
epicsEnvSet ("PORT_MM4006_XENA", "serial_mm4006_1")

## Register all support components
dbLoadDatabase "dbd/mm4006IOC.dbd"
mm4006IOC_registerRecordDeviceDriver pdbbase

drvAsynIPPortConfigure($(PORT_MM4006_XENA), "100.100.0.5:4003")
asynOctetSetInputEos($(PORT_MM4006_XENA),0,"\n")
asynOctetSetOutputEos($(PORT_MM4006_XENA),0,"\n")

asynSetTraceMask($(PORT_MM4006_XENA),-1,0x9);
asynSetTraceIOMask($(PORT_MM4006_XENA),-1,0x2)


## Load record instances
#dbLoadRecords("db/mm4006IOC.db","user=xlabsrv2")

dbLoadTemplate("db/mm4006IOC.val")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=xlabsrv2"
