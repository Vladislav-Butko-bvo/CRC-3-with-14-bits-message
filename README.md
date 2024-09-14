# CRC-3-with-14-bits-message
Verilog and VHDL descriptions of interface with encoder of 14 bits message is using 3-bit cyclic redundancy check (CRC) algorithm

Wikipedia CRC-3 example (https://en.wikipedia.org/wiki/Cyclic_redundancy_check) was implemented.

In description message length equal 17 bits consisting of 14 bits message and 3 bits padding (equal "000") for control sum (is calculating by CRC algorithm). 

While Verilog simulation in console can be seen result of encapsulation (remainder equals binary "100") and decapsulation  (remainder equals binary "000"). Result of encapsulation is result of CRC-3 algorithm applying to 17 bits original massage. Result of decapsulation is result of CRC-3 algorithm applying to 17 bits encapsulated massage.  

Verilog behavioral simulation:

![Verilog behavioral simulation](https://github.com/user-attachments/assets/64eb248c-0e19-413d-a1a9-3e850ffb63e8)

While VHDL simulation in console can be seen 

VHDL behavioral simulation (with CRC_encaps and CRC_decaps instances):

![VHDL behavioral simulation (with CRC_encaps and CRC_decaps instances)](https://github.com/user-attachments/assets/37456256-6c64-4cd1-af51-875aead6bef6)

VHDL behavioral simulation (with CRC_encaps and CRC_decaps instances):

![VHDL behavioral simulation (with only CRC_encaps instance](https://github.com/user-attachments/assets/ee9f9ec3-26e2-4fab-9f6c-e17c5b6ac27b)


