    //message lenght can be devided on user data area 
    //in MSG_LENGTH - POLINOMIAL_LENGTH = 14 bits 
    //and 3 bits area for control sum 
`define MSG_LENGTH 17
    //do avaible to use 3-degree polynomial
`define POLINOMIAL_LENGTH 4
    //remainder length
`define CONTROL_SUM_LENGHT `POLINOMIAL_LENGTH-1 

`timescale 1ns / 1ps
    //interface with encoder of 14 bits message is using 3-bit CRC algorithm
module CRC_int(   
        //initiates CRC encapsulation 
    input enable,
        //initiates CRC decapsulation
    input enable2,
        //message with user data and padding for control sum
    input [`MSG_LENGTH-1:0] msg,
        //polynomial is written in binary as the coefficients.
        //It is known by both side of data channel
    input [`POLINOMIAL_LENGTH-1:0] polinom,
        //decapsulated (original) message
    output [`MSG_LENGTH-1:0] msg_output
    );
    
  //gets encapsulated massage from CRC_encaps 
	//and send it to CRC_decaps
wire [`MSG_LENGTH-1:0] w_msg_output;  
    
initial@(posedge enable) $display("ENCAPSULATION");   
    //CRC encapsulation before writing message at
    //output port of the interface with CRC algorithm
CRC CRC_encaps(enable, msg, polinom, w_msg_output);

initial@(posedge enable2) $display("DECAPSULATION");
    //CRC decapsulation before reading message at
    //input port of the interface with CRC algorithm
CRC CRC_decaps(enable2, w_msg_output, polinom, msg_output);

endmodule

    //Realization of encoder of 14 bits message is using 3-bit CRC algorithm.
    //Encoder algorithm same for encapsulation and decapsulation of message
module CRC(
        //initiates CRC algorithm executing
    input enable,
        //contains user data and padding for control sum 
        //or calculated control sum in advance
    input [`MSG_LENGTH-1:0] msg,
    input [`POLINOMIAL_LENGTH-1:0] polinom,
        //contains user data and calculated control sum
    output reg [`MSG_LENGTH-1:0] msg_output
    );
  
    //register for saving a temporary result of operations under msg
reg [`MSG_LENGTH-1:0] msgBuff;
    //while loop index
integer i;
    
always@(posedge enable)
begin    
    msgBuff = msg;
    i = `MSG_LENGTH-1;
    
        //control sum calculation (user data is dividing by polinom)
    while(i >= `CONTROL_SUM_LENGHT)
    begin 
            //align with the next 1 in the dividend
       if(msgBuff[i] != 0) begin
                //doing xor operations under POLINOMIAL_LENGTH bits per operation
            msgBuff[i] = msgBuff[i] ^ polinom[3]; 
            msgBuff[i-1] = msgBuff[i-1] ^ polinom[2]; 
            msgBuff[i-2] = msgBuff[i-2] ^ polinom[1]; 
            msgBuff[i-3] = msgBuff[i-3] ^ polinom[0];  
            $display("time = %0t, msgBuff = %b, i = %d", $time, msgBuff, i);
       end
         i = i - 1;
    end
        //writing of user data and control sum (remainder after dividing) on the output
    msg_output = {msg[16:3], msgBuff[2:0]};
end
    
endmodule
