onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ins_mem_opt

do {wave.do}

view wave
view structure
view signals

do {ins_mem.udo}

run -all

quit -force
