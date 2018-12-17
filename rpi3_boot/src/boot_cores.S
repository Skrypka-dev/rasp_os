.section ".text.boot"

.global _boot_cores

_boot_cores:
1:	wfe
	b	1b
