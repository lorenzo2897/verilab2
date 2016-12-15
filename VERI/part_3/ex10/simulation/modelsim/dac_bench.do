add wave sysclk data_in load dac_sdi dac_cs dac_sck dac_ld
force sysclk 0 0, 1 10ns -repeat 20ns
force data_in 16#23b
force load 0
run 20ns
force load 1
run 20ns
force load 0
run 340ns
