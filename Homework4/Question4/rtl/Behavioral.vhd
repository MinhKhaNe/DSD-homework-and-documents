library IEEE;
use IEEE.std_logic_1164.all;

entity nor_gate is
port(
  a: in std_logic;
  b: in std_logic;
  q: out std_logic);
end nor_gate;

architecture rtl of nor_gate is
begin
  process(a, b) is
  begin
    if(a = '0' and b = '0') then
    	q <= '1';
    else
    	q <= '0';
    end if;
  end process;
end rtl;
