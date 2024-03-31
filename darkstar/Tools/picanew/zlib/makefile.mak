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

ZLIB_OBJS = 		\
	adler32.obj		\
	compress.obj	\
	crc32.obj		\
	deflate.obj		\
	gzio.obj		\
	infblock.obj	\
	infcodes.obj	\
	inffast.obj		\
	inflate.obj		\
	inftrees.obj	\
	infutil.obj		\
	uncompr.obj		\
	zutil.obj


#------------------------------------------------------------------------------
%ifdef CG32
CPPFLAGS += -vG
%endif

all: $(LIBdest)\$(DEBUG)$(COMPILER)ZLib.lib

$(LIBdest)\$(DEBUG)$(COMPILER)ZLib.lib:   \
   $(ZLIB_OBJS)

#------------------------------------------------------------------------------
copy :
   %echo copying ZLib files ...
   @xcopy /Y /D inc $(PHOENIXINC) /R /Q /I > NUL
   @xcopy /Y /D lib\*.lib $(PHOENIXLIB) /R /Q /I > NUL
   %if %defined(PHOENIXCODE)
      @xcopy /Y /D code  $(PHOENIXCODE) /R /Q /I > NUL
   %endif
   %if "$(DEBUG)" && $(COMPILER) == "m"
      %echo copying Microsoft debug information ...
      @xcopy /Y /D *.pdb $(PHOENIXLIB) /R /Q > NUL
   %endif
