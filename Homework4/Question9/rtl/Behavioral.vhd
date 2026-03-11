library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity priority_encoder_4to2 is
port(
  d 	: in  std_logic_vector(3 downto 0); 
  y 	: out std_logic_vector(1 downto 0); 
  valid : out std_logic                 
  );
end priority_encoder_4to2;

architecture rtl of priority_encoder_4to2 is
begin
	process(d) is  
	begin
    
    	if (d(3) = '1') then
            y <= "11";
            valid <= '1';
        elsif (d(2) = '1') then
            y <= "10";
            valid <= '1';
        elsif (d(1) = '1') then
            y <= "01";
            valid <= '1';
        elsif (d(0) = '1') then
            y <= "00";
            valid <= '1';
        else
            y <= "00";
            valid <= '0';
        end if;
    
    end process;
end rtl;
