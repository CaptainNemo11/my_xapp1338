# Overview
This is my implementation of [xapp1338](https://docs.amd.com/r/en-US/xapp1338-fast-partial-reconfiguration-pci-express), specifically tailored for the Xilinx/AMD VU37P FPGA chip.
This work serves as a preliminary experiment for enhancing the [NEXST (desktop version)](https://github.com/CaptainNemo11/NEXST_desktop_version) system. The improvement focuses on optimizing the system through dynamic partial reconfiguration, which allows the host to dynamically configure processor cores via PCIe.However, extensive experiments revealed that the current hardware and software system on the VU37p chip is not suitable for dynamic reconfiguration optimization. Consequently, this optimization challenge was extended to the topic of logic partitioning.

