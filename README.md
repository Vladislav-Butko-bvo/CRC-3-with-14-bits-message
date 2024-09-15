# CRC-3-with-14-bits-message
**Description:*** Verilog and VHDL descriptions of interface with encoder of 14 bits message is using 3-bit cyclic redundancy check (CRC) algorithm.

Wikipedia CRC-3 example ("Computation" section of article: https://en.wikipedia.org/wiki/Cyclic_redundancy_check) was realised.

In HDL descriptions the message length equals 17 bits consisting of 14 bits message (user data) and 3 bits padding (equals "000" for original or decapsulated message) for control sum (is calculating by CRC algorithm). 

While Verilog simulation in console can be seen result of applying CRC-3 algorithm to original message (result equals binary "100" – encapsulation remainder or control sum) and result of applying CRC-3 algorithm to encapsulated massage (result equals binary "000" – decapsulation remainder or padding for original message). Result of encapsulation is user data with encapsulation remainder. Result of decapsulation is user data with decapsulation remainder.  

Verilog behavioral simulation:

![Verilog behavioral simulation](https://github.com/user-attachments/assets/64eb248c-0e19-413d-a1a9-3e850ffb63e8)

VHDL behavioral simulation waveform shows result of decapsulation:

![VHDL behavioral simulation (with CRC_encaps and CRC_decaps instances)](https://github.com/user-attachments/assets/37456256-6c64-4cd1-af51-875aead6bef6)

VHDL (with only CRC_encaps instance in interface.vhd) behavioral simulation shows result of ecapsulation:

![VHDL behavioral simulation (with only CRC_encaps instance](https://github.com/user-attachments/assets/ee9f9ec3-26e2-4fab-9f6c-e17c5b6ac27b)

Both Verilog and VHDL despriptions was synthesized and implemented on virtual Xilinx FPGA Kintex-7 (xc7k70tfbv676-1).

Nevetheless description language same FPGA resource amount was used. See utilization report, primitives section: 

![Used FPGA resources](https://github.com/user-attachments/assets/903a0034-4c19-4b9b-9a46-aa86018b9ed7)



