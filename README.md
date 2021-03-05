# fxCore
fxCore is a project of kernel, targetting Casio FXCG50 calculators.

Informations
============
As Casio's default OS on these platforms never switches to user mode, the kernel can be started like an Addin and deals directly with protected mode.  

The CPU primarly targeted is the SH4A 77050 modified by Casio, used on FXCG50.This CPU has a modern architecture, with priviligied/user modes, MMU for virtual memory and memory access control, cache, embedded USB device controller... All these things allow to have a modern kernel, with a good process isolation.   

Build and Install
=================
**First of all** : be sure about what you are doing before to start! Any part of the program may cause damage to your machine, especially if you are using it on a not tested platform. It is certain that fxCore will overwrite Casio's default OS data, and after this add-in is started, it can only restarted to return to the default system.  

To build the project, you must use a GCC toolchain configured for SuperH targets. [PrizmSDK](https://github.com/Jonimoose/libfxcg) is recommended here.  

More
====
See [WIKI](https://github.com/Stage-sys/fxCore/wiki).   
