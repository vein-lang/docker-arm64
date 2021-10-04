FROM ubuntu:18.04

LABEL TITLE="Vien Lang Build Container"
LABEL DESCRIPTION="For build IshtarVM in arm64 with crossfs"
LABEL VERSION="1.0"

RUN apt-get update
RUN apt-get install -y clang zlib1g-dev libkrb5-dev libssl-dev \
 qemu qemu-user-static binfmt-support \
 debootstrap crossbuild-essential-arm64 \
 binutils-arm-linux-gnueabihf binutils-aarch64-linux-gnu \
 binutils-arm-linux-gnueabi
RUN apt install gcc-multilib clang-9 bash -y

WORKDIR /cross
COPY ./cross /cross

RUN chmod +x /cross/build-rootfs.sh
RUN ./build-rootfs.sh arm64

CMD ["bash"]