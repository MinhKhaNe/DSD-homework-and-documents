library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity decoder_2to4 is
port(
  a : in  std_logic_vector(1 downto 0);
  y : out std_logic_vector(3 downto 0)
  );
end decoder_2to4;

architecture rtl of decoder_2to4 is
begin
	process(a) is  
	begin
    
    case a is
            when "00" => y <= "0001";
            when "01" => y <= "0010";
            when "10" => y <= "0100";
            when "11" => y <= "1000";
            when others => y <= "0000";
    end case;
    
    end process;
end rtl;
