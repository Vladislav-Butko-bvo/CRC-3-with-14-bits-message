# CRC-3-with-14-bits-message
Verilog and VHDL descriptions of interface with encoder of 14 bits message is using 3-bit cyclic redundancy check (CRC) algorithm

Wikipedia CRC-3 example (https://en.wikipedia.org/wiki/Cyclic_redundancy_check) was implemented.

In descriptions message length equals 17 bits consisting of 14 bits message and 3 bits padding (equal "000") for control sum (is calculating by CRC algorithm). 

While Verilog simulation in console can be seen result of applying CRC-3 algorithm to original massage (result equals binary "100" – encapsulation remainder) and to encapsulated massage (result equals binary "000" – decapsulation remainder). Result of encapsulation is original message with encapsulation remainder. Result of decapsulation is original message with decapsulation remainder.  

Verilog behavioral simulation:

![Verilog behavioral simulation](https://github.com/user-attachments/assets/64eb248c-0e19-413d-a1a9-3e850ffb63e8)

VHDL (with CRC_encaps and CRC_decaps instances) behavioral simulation waveform shows result of decapsulation (original message consisting of 14 bit massage and 3 bits padding):

![VHDL behavioral simulation (with CRC_encaps and CRC_decaps instances)](https://github.com/user-attachments/assets/37456256-6c64-4cd1-af51-875aead6bef6)

VHDL (with only CRC_encaps instance) behavioral simulation shows result of ecapsulation (encapsulated message consisting of 14 bit massage and 3 bits control sum):

![VHDL behavioral simulation (with only CRC_encaps instance](https://github.com/user-attachments/assets/ee9f9ec3-26e2-4fab-9f6c-e17c5b6ac27b)


