library IEEE;
use IEEE.std_logic_1164.all;

entity input_or_gate is
port(
  a: in std_logic;
  b: in std_logic;
  c: in std_logic;
  q: out std_logic);
end input_or_gate;

architecture rtl of input_or_gate is
begin
  process(a, b, c) is
  begin
    if(a = '0' and b = '0' and c = '0') then
    	q <= '0';
    else
    	q <= '1';
    end if;
  end process;
end rtl;
