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
    
    y(1) <= d(3) or d(2);
    y(0) <= d(3) or (not d(2) and d(1));
    valid <= d(3) or d(2) or d(1) or d(0);
    
    end process;
end rtl;
