library IEEE;
use IEEE.std_logic_1164.all;

entity input_and_gate is
port(
  a: in std_logic;
  b: in std_logic;
  c: in std_logic;
  q: out std_logic);
end input_and_gate;

architecture rtl of input_and_gate is
begin
  process(a, b, c) is
  begin
    q <= a and b and c;
  end process;
end rtl;
