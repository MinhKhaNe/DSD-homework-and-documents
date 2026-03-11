library IEEE;
use IEEE.std_logic_1164.all;

entity nand_gate is
port(
  a: in std_logic;
  b: in std_logic;
  q: out std_logic);
end nand_gate;

architecture rtl of nand_gate is
begin
  process(a, b) is
  begin
    if(a = '1' and b = '1') then
    	q <= '0';
    else
    	q <= '1';
    end if;
  end process;
end rtl;
