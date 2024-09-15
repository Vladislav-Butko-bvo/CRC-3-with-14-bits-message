`define MSG_LENGTH 17
`define POLINOMIAL_LENGTH 4

`timescale 1ns / 1ps
module CRC_tb;

reg enable;
reg enable2;
reg [`MSG_LENGTH-1:0] msg;
reg [`POLINOMIAL_LENGTH-1:0] polinom;
wire [`MSG_LENGTH-1:0] msg_output;

CRC_int CRC_int_1(enable, enable2, msg, polinom, msg_output);

initial
begin
    enable = 0; 
    enable2 = 0;
    msg = `MSG_LENGTH'b11010011101100000;   //message with user data and padding for control sum
    polinom = `POLINOMIAL_LENGTH'b1011;
    #110 enable = 1;
    #120 enable2 = 1;
end 

endmodule
