library ieee;
use ieee.std_logic_1164.all;

entity CRC_tb is
    generic
	  (
		MSG_LENGTH : integer := 17;
		POLINOMIAL_LENGTH : integer := 4
    );
end entity CRC_tb;

architecture CRC_tb_1 of CRC_tb is
    signal enable : std_logic;
    signal enable2 : std_logic;
    signal msg : std_logic_vector(MSG_LENGTH-1 downto 0);
    signal polinom : std_logic_vector(POLINOMIAL_LENGTH-1 downto 0);
    signal msg_output : std_logic_vector(MSG_LENGTH-1 downto 0);  
begin

    CRC_init_1 : entity work.CRC_init
        port map (
            enable=>enable, 
            enable2=>enable2,
            msg=>msg, 
            polinom=>polinom, 
            msg_output=>msg_output
        );

    process begin
       enable <= '0';
       enable2 <= '0';
       msg <= "11010011101100000";   --message with user data and padding for control sum
       polinom <= "1011";
       wait for 10 ns;
       enable <= '1';
       wait for 10 ns;
       enable2 <= '1';
       wait; 
    end process;
    
end architecture CRC_tb_1;
    
