FROM ghcr.io/vein-lang/ubuntu18.04-with-crossroot-arm64


RUN git clone https://github.com/vein-lang/vein.git
RUN cd ./vein && git fetch --all && git checkout master
RUN dotnet tool install --global --version 5.6.7 GitVersion.Tool
RUN cd ./vein && dotnet restore
RUN cd ./vein/runtime/ishtar.vm && dotnet publish -r linux-arm64 -c Release \
 -p:CppCompilerAndLinker=clang-9 -p:SysRoot=/.tools/rootfs/arm64

CMD [ "bash" ]