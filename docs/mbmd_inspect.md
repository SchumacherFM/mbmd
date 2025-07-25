## mbmd inspect

Inspect SunSpec device models and implemented values

### Synopsis

Inspect will iterate across the SunSpec model definition for the specified device and print details about defined models and data points.
Devices are expected to be specified on command line- config file is being ignored.
Limited to SunSpec TCP devices (EXPERIMENTAL).

```
mbmd inspect [flags]
```

### Options

```
  -d, --devices strings   MODBUS device type and ID to query, multiple devices separated by comma or by repeating the flag.
                            Example: -d SDM:1,SDM:2 -d DZG:1.
                          Valid types are:
                            RTU
                              ABB       ABB A/B-Series meters
                              CGEM24    Carlo Gavazzi EM24
                              CGEM24_E1 Carlo Gavazzi EM24_E1
                              CGEX3X0   Carlo Gavazzi EM/ET 330/340
                              DDM       DDM18SD
                              DMG610    Lovato DMG610
                              DS100     B+G e-tech DS100
                              DZG       DZG Metering GmbH DVH4013 meters
                              IEM3000   Schneider Electric iEM3000 series
                              INEPRO    Inepro Metering Pro 380
                              JANITZA   Janitza B-Series meters
                              MPM       Bernecker Engineering MPM3PM meters
                              ORNO1P504 ORNO WE-504
                              ORNO1p    ORNO WE-514 & WE-515
                              ORNO1p525 ORNO WE-525 & WE-526
                              ORNO3p    ORNO WE-516 & WE-517
                              PAC2200   Siemens PAC2200
                              SBC       Saia Burgess Controls ALE3 meters
                              SDM       Eastron SDM630
                              SDM220    Eastron SDM220
                              SDM230    Eastron SDM230
                              SDM54     Eastron SDM54
                              SDM72     Eastron SDM72
                              SEMTR     SolarEdge SE-MTR-3Y
                              WAGO87930 Wago 879-30XX
                              WS100     B+G e-tech WS100
                              X961A     Eastron SMART X96-1A
                            TCP
                              SUNS      Sunspec-compatible MODBUS TCP device (SMA, SolarEdge, KOSTAL, etc)
                          To use an adapter different from default, append RTU device or TCP address separated by @.
                          If the adapter is a TCP connection (identified by :port), the device type (SUNS) is ignored and
                          any type is considered valid.
                            Example: -d SDM:1@/dev/USB11 -d SMA:126@localhost:502
```

### Options inherited from parent commands

```
  -a, --adapter string     Default MODBUS adapter. This option can be used if all devices are attached to a single adapter.
                           Can be either an RTU device (/dev/ttyUSB0) or TCP socket (localhost:502).
                           The default adapter can be overridden per device
  -b, --baudrate int       Serial interface baud rate (default 9600)
      --comset string      Communication parameters for default adapter, either 8N1 or 8E1.
                           Only applicable if the default adapter is an RTU device (default "8N1")
  -c, --config string      Config file (default is $HOME/mbmd.yaml, ./mbmd.yaml, /etc/mbmd.yaml)
  -h, --help               Help for mbmd
      --raw                Log raw device data
      --rtu                Use RTU over TCP for default adapter.
                           Typically used with RS485 to Ethernet adapters that don't perform protocol conversion (e.g. USR-TCP232).
                           Only applicable if the default adapter is a TCP connection
      --timeout duration   Timeout for MODBUS communication (default 300ms)
  -v, --verbose            Verbose mode
```

### SEE ALSO

* [mbmd](mbmd.md)	 - ModBus Measurement Daemon

