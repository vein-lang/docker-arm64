FROM mcr.microsoft.com/dotnet/sdk:6.0.100-preview.2-focal-amd64

LABEL TITLE="Vien Lang Build Container"
LABEL DESCRIPTION="For build IshtarVM in arm64 with crossfs"
LABEL VERSION="1.0"

RUN apt-get update
RUN apt-get install apt-utils -y
RUN apt-get install -y clang zlib1g-dev libkrb5-dev libssl-dev \
 qemu qemu-user-static binfmt-support \
 debootstrap crossbuild-essential-arm64 \
 binutils-arm-linux-gnueabihf binutils-aarch64-linux-gnu \
 binutils-arm-linux-gnueabi
RUN apt install gcc-multilib clang-9 bash curl -y
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

WORKDIR /cross
COPY ./cross /cross

RUN chmod +x /cross/build-rootfs.sh
RUN ./build-rootfs.sh arm64

CMD ["bash"]