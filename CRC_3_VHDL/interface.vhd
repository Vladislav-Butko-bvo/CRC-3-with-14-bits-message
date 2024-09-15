library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

    --interface with encoder of 14 bits message is using 3-bit CRC algorithm 
entity CRC_init is	
    generic
	(
		    --message lenght can be devided on user data area 
                    --in MSG_LENGTH - POLINOMIAL_LENGTH = 14 bits 
                    --and 3 bits area for control sum 
		MSG_LENGTH : integer := 17;
		    --do avaible to use 3-degree polynomial
		POLINOMIAL_LENGTH : integer := 4
    );
    port(
            --initiates CRC encapsulation
        enable : in std_logic;
            --initiates CRC decapsulation
        enable2 : in std_logic;
	    --message with user data and padding for control sum
        msg : in std_logic_vector(MSG_LENGTH-1 downto 0);
            --polynomial is written in binary as the coefficients.
            --It is known by both side of data channel
        polinom : in std_logic_vector(POLINOMIAL_LENGTH-1 downto 0);
            --decapsulated message
        msg_output : out std_logic_vector(MSG_LENGTH-1 downto 0)
    );
end CRC_init;

architecture CRC_init_1 of CRC_init is
        --gets encapsulated massage from CRC_encaps 
	--and send it to CRC_decaps
    signal w_msg_output : std_logic_vector(MSG_LENGTH-1 downto 0);  
begin

    --CRC encapsulation before writing message at
    --output port of the interface with CRC algorithm
CRC_encaps : entity work.CRC	
        port map (
            enable=>enable, 
            msg=>msg, 
            polinom=>polinom, 
            msg_output=>w_msg_output
        );
        
    --CRC decapsulation before reading message at
    --input port of the interface with CRC algorithm
CRC_decaps : entity work.CRC	 
        port map (
            enable=>enable2, 
            msg=>w_msg_output, 
            polinom=>polinom, 
            msg_output=>msg_output
        );
          
end CRC_init_1;
