library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bin2gray_3bit is
port(
  		gray : in  std_logic_vector(2 downto 0);
        bin  : out std_logic_vector(2 downto 0)                 
  );
end bin2gray_3bit;

architecture rtl of bin2gray_3bit is
begin
	process(gray)
        variable temp : std_logic_vector(2 downto 0);
    begin
        temp(2) := gray(2);
        temp(1) := temp(2) xor gray(1);
        temp(0) := temp(1) xor gray(0);
        bin <= temp;
    end process;
end rtl;
