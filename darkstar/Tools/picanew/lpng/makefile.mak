#����������������������������������������������������������������
#��   
#�� $Workfile:   makefile.mak  $
#�� $Version$
#�� $Revision:   1.10  $
#��   
#�� DESCRIPTION:
#��   
#�� (c) Copyright 1995, Dynamix Inc.   All rights reserved.
#����������������������������������������������������������������

PHOENIXMAKE ?= ..\makes
%include <$(PHOENIXMAKE)\builtins.mak>

#��������������������������������������������� LIBRARIES

LPNG_OBJS = 		\
	png.obj 		\
	pngerror.obj 	\
	pngmem.obj 		\
	pngpread.obj 	\
	pngread.obj 	\
	pngset.obj 		\
	pngget.obj 		\
	pngrio.obj		\
	pngrtran.obj 	\
	pngrutil.obj 	\
	pngtrans.obj 	\
	pngwrite.obj 	\
	pngwtran.obj 	\
	pngwio.obj	 	\
	pngwutil.obj


#------------------------------------------------------------------------------
%ifdef CG32
CPPFLAGS += -vG
%endif

all: $(LIBdest)\$(DEBUG)$(COMPILER)LPng.lib

$(LIBdest)\$(DEBUG)$(COMPILER)LPng.lib:   \
   $(LPNG_OBJS)

#------------------------------------------------------------------------------
copy :
   %echo copying LPng files ...
   @xcopy /Y /D inc $(PHOENIXINC) /R /Q /I > NUL
   @xcopy /Y /D lib\*.lib $(PHOENIXLIB) /R /Q /I > NUL
   %if %defined(PHOENIXCODE)
      @xcopy /Y /D code  $(PHOENIXCODE) /R /Q /I > NUL
   %endif
   %if "$(DEBUG)" && $(COMPILER) == "m"
      %echo copying Microsoft debug information ...
      @xcopy /Y /D *.pdb $(PHOENIXLIB) /R /Q > NUL
   %endif
