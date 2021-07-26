.PHONY: sim
sim: soc_domain.v
	verilator -cc $< -Wall -Wno-fatal -Wno-BLKANDNBLK -Wno-BLKLOOPINIT --top-module soc_domain -CFLAGS "-std=c++11 -Wall -g -O0"

soc_domain.v: soc_domain.sv
	sv2v $< > $@

# The SystemVerilog reference file compiles
.PHONY: reference
reference: soc_domain.sv
	verilator -cc $< -Wall -Wno-fatal -Wno-BLKANDNBLK -Wno-BLKLOOPINIT --top-module soc_domain -CFLAGS "-std=c++11 -Wall -g -O0"
