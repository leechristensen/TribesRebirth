FROM tifkin/tribes-build-image

RUN powershell.exe -C \
    [Environment]::SetEnvironmentVariable('COMPILER', 'b', [EnvironmentVariableTarget]::Machine);\
    [Environment]::SetEnvironmentVariable('TASM', 'C:\TASM\BIN\', [EnvironmentVariableTarget]::Machine)

# Optimized (Release) build? 0 = Disabled (Debug build), 1 = Enabled
ENV OPT 0

WORKDIR /code/