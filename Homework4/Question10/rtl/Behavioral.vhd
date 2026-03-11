library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bin2gray_3bit is
port(
  bin  : in  std_logic_vector(2 downto 0);
  gray : out std_logic_vector(2 downto 0)                 
  );
end bin2gray_3bit;

architecture rtl of bin2gray_3bit is
begin
	process(bin) is  
	begin
  
    	gray(2) <= bin(2);
        gray(1) <= bin(2) xor bin(1);
        gray(0) <= bin(1) xor bin(0);
    
    end process;
end rtl;
