##############################################################################
PHOENIXMAKE ?= ..\makes
%include <$(PHOENIXMAKE)\builtins.mak>

#%set PRECOMPILED_HEADER=

.PATH.exe = .


##############################################################################
#
LOBJ =   terrData.obj \
		 terrRender.obj \
		 gridToTerr.obj

$(LIBdest)\$(BuildPrefix)terr.lib: $(LOBJ)

copy :
   %echo copying Terrain files...
   @xcopy /Y /D inc\*.h $(PHOENIXINC) /R /Q  > NUL
   @--xcopy /Y /D lib\*.lib $(PHOENIXLIB) /R /Q  > NUL
   %if %defined(PHOENIXCODE)
      @xcopy /Y /D code $(PHOENIXCODE) /R /Q  > NUL
   %endif
   %if "$(DEBUG)" && $(COMPILER) == "m"
      %echo copying Microsoft debug information ...
      @xcopy /Y /D *.pdb $(PHOENIXLIB) /R /Q > NUL
   %endif

