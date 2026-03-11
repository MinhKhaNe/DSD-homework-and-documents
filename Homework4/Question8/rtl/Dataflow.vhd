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
    y(0) <= not a(1) and not a(0);
    y(1) <= not a(1) and a(0);
    y(2) <= a(1) and not a(0);
    y(3) <= a(1) and a(0);
    end process;
end rtl;
