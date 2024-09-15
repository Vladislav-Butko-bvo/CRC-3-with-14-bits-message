library ieee;
use ieee.STD_LOGIC_1164.ALL;

    --Realization of encoder of 14 bits message is using 3-bit CRC algorithm.
    --Encoder algorithm same for encapsulation and decapsulation of message
entity CRC is    
    generic
	(
		MSG_LENGTH : integer := 17;  
		POLINOMIAL_LENGTH : integer := 4;     
		    --remainder length
		CONTROL_SUM_LENGHT : integer := 3     
    );
    port(
            --initiates CRC algorithm executing
        enable : in std_logic;				                           
            --contains user data and padding for control sum 
            --or calculated control sum in advance
        msg : in std_logic_vector(MSG_LENGTH-1 downto 0);		       
        polinom : in std_logic_vector(POLINOMIAL_LENGTH-1 downto 0);   
            --contains user data and calculated control sum
        msg_output : out std_logic_vector(MSG_LENGTH-1 downto 0)       
    );
end CRC;

architecture CRC_1 of CRC is
begin

process (enable)
        --register for saving a temporary result of operations under msg
   variable msgBuff : std_logic_vector(MSG_LENGTH-1 downto 0);	
        --while loop index
   variable i : integer;
begin

  if rising_edge(enable) then  

    report "CRC algorithm start";
    msgBuff := msg;
    i := MSG_LENGTH-1;
    
        --control sum calculation (user data is dividing by polinom)
    while i>=CONTROL_SUM_LENGHT loop
            --align with the next 1 in the dividend
        if msgBuff(i) /= '0' then   
                --doing xor operations under POLINOMIAL_LENGTH bits per operation
            msgBuff(i downto i-(POLINOMIAL_LENGTH-1)) := msgBuff(i downto i-(POLINOMIAL_LENGTH-1)) xor polinom; 
        end if;
        i := i - 1;
    end loop;   
       
       --writing of user data and control sum (remainder after dividing) on the output
   msg_output <= msg(MSG_LENGTH-1 downto CONTROL_SUM_LENGHT) & msgBuff(CONTROL_SUM_LENGHT-1 downto 0);

  end if;
end process;

end CRC_1;
