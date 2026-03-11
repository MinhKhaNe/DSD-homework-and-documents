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
    q <= not(a or b);
  end process;
end rtl;
