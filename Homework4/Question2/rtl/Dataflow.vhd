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
    q <= a or b or c;
  end process;
end rtl;
