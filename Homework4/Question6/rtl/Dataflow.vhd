library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity comparator_4bit is
port(
  a, b: in  std_logic_vector(3 downto 0);
  a_eq_b: out std_logic;
  a_le_b: out std_logic;
  a_gr_b: out std_logic);
end comparator_4bit;

architecture rtl of comparator_4bit is
begin
  process(a, b) is
  begin
    a_eq_b <= '1' when unsigned(a) = unsigned(b) else '0';
    a_le_b <= '1' when unsigned(a) < unsigned(b) else '0';
    a_gr_b <= '1' when unsigned(a) > unsigned(b) else '0';
  end process;
end rtl;
