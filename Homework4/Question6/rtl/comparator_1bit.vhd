library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity comparator_1bit is
port(
  a, b	: in  std_logic;
  a_eq_b: out std_logic;
  a_le_b: out std_logic;
  a_gr_b: out std_logic);
end comparator_1bit;

architecture rtl of comparator_1bit is
begin
  process(a, b) is
  signal nota, notb : std_logic;
  begin
	nota <= not(a);
	notb <= not(b);

    	a_gr_b <= a and notb;
	a_le_b <= nota and b;
	a_eq_b <= (nota and notb) or (a and b);
  
  end process;
end rtl;
