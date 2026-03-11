library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity parity_4bit is
port(
  a		: in  std_logic_vector(3 downto 0);
  parity: out std_logic);
end parity_4bit;

architecture rtl of parity_4bit is
begin
  process(a) is
  begin
    parity <= a(0) xor a(1) xor a(2) xor a(3);
  end process;
end rtl;
