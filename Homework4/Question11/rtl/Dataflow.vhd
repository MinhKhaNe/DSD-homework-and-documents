library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity gray2bin is
port(
  		gray : in  std_logic_vector(2 downto 0);
        bin  : out std_logic_vector(2 downto 0)                 
  );
end gray2bin;

architecture rtl of gray2bin is
begin
	process(bin) is  
	begin
  
    	bin(2) <= gray(2);
    	bin(1) <= gray(2) xor gray(1);
    	bin(0) <= gray(2) xor gray(1) xor gray(0);
    
    end process;
end rtl;
