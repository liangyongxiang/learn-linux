.PHONY: kernel
kernel:
	mkdir -p output/kernel/linux
	cd repos/linux && \
	$(MAKE) defconfig O=../../output/kernel/linux && \
	$(MAKE) O=../../output/kernel/linux

.PHONY: qemu-run
qemu-run:
	qemu-system-x86_64 \
		-cpu max \
		-machine pc \
		-append "console=ttyS0" \
		-kernel output/kernel/linux/arch/x86/boot/bzImage \
		-nographic

.PHONY: kernel
clean:
	rm -rf output
