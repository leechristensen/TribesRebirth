# Overview
An attempt to build the Tribes source code using the original toolchain. The intent behind doing this is to assist in reverse engineering as one can use compiled artifacts to build function matching signatures (Ida flirt signatures, Ghidra function ID databases, BinDiff exports, Ghidra BSim databases, etc.). 

# Building
Right now, only building the darkstar engine works. I currently use [a Windows docker image](https://github.com/leechristensen/tribes-build-image). Build process is as follows:
1. Start the docker image:
```
docker run --rm -ti -v C:\code\TribesRebirth\:C:\code tribes-build-image cmd.exe
```

2. Setup the build environment:
```
set OPT=1
set COMPILER=b
set PHOENIXMAKE=C:\code\darkstar\makes\
set PATH=%PATH%;C:\code\darkstar\Toolbin
set TASM=C:\TASM\BIN\
```
Environment variable explanations:
- `OPT` controls whether to do a Debug or Release (optimized) build (`0` or `1`, respectively)
- `COMPILER` sets the compiler (`b`=Borland)
- `PHOENIXMAKE` path to some make files that part of the build relies on
- The `PATH` is modified since a part of the build requires `tag2bin.exe`

3. Build darkstar:
```
cd darkstar
make
```
4. The build's output will be found in 4 folders at `C:\Phoenix`:
- `C:\Phoenix\Code` - cpp/.asm files used during compilation
- `C:\Phoenix\Data` - Data artifacts generated (.cs and .vol files)
    <details>
      <summary>Contents of C:\Phoenix\Data</summary>
      
      ```
      C:\Phoenix\Data\commonEditor.strings.cs
      C:\Phoenix\Data\darkstar.strings.cs
      C:\Phoenix\Data\Darkstar.vol
      C:\Phoenix\Data\editor.strings.cs
      C:\Phoenix\Data\Editor.vol
      C:\Phoenix\Data\esf.strings.cs
      C:\Phoenix\Data\ted.cs
      C:\Phoenix\Data\ted.vol
      ```
    </details>
- `C:\Phoenix\Inc` - Header files used during compilation
- `C:\Phoenix\Lib` - .lib/.res files output from the compilation
    <details>
      <summary>Contents of C:\Phoenix\Lib\</summary>
      
      ```
      C:\Phoenix\Lib\BayWatch.res
      C:\Phoenix\Lib\dbBayes.lib
      C:\Phoenix\Lib\dbCommon.lib
      C:\Phoenix\Lib\dbconsole.lib
      C:\Phoenix\Lib\dbCore.lib
      C:\Phoenix\Lib\dbdnet.lib
      C:\Phoenix\Lib\dbgfx.lib
      C:\Phoenix\Lib\dbgfxio.lib
      C:\Phoenix\Lib\dbgrd.lib
      C:\Phoenix\Lib\dbGW.lib
      C:\Phoenix\Lib\dbitr.lib
      C:\Phoenix\Lib\dbls.lib
      C:\Phoenix\Lib\dbml.lib
      C:\Phoenix\Lib\dbSim.lib
      C:\Phoenix\Lib\dbSimGui.lib
      C:\Phoenix\Lib\dbSimNet.lib
      C:\Phoenix\Lib\dbSimObjects.lib
      C:\Phoenix\Lib\dbSSCommon.lib
      C:\Phoenix\Lib\dbSSSim.lib
      C:\Phoenix\Lib\dbSSSimObjects.lib
      C:\Phoenix\Lib\dbTed.lib
      C:\Phoenix\Lib\dbterr.lib
      C:\Phoenix\Lib\dbts3.lib
      C:\Phoenix\Lib\dbzeditr.lib
      C:\Phoenix\Lib\LSDlg.res
      C:\Phoenix\Lib\ted.RES
      C:\Phoenix\Lib\toolPlugin.res
      ```
    </details>

# Status
- [x] `make [all]` works in the `darkstar` folder.
- [ ] Analyze all of the makefiles in the `darkstar` folder and ensure all build targets compile.
- [ ] Add MSVC to the build image since some things under the `Tools` folder are built with it
- [ ] `tag2bin.exe` currently does not work correctly when built. Maybe try and find v5.01 of the Borland C++ compiler since the makefiles said that's the verion used (I could only find 5.02, so that's what's currently being used).

- [ ] Get the `program` folder building
  - [ ] Add missing header files
  - [ ] Obtain missing game assets (fonts.vol, scripts.vol, gui.vol, prefab.vol) and store them under exe\base\fonts\, exe\base\scripts\, exe\base\gui\, and exe\base\prefabs\.

- [ ] Investigate making Borland/TASM work under Wine so we can build with Linux containers instead.
