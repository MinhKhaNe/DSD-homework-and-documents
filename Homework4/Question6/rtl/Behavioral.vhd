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
    if unsigned(a) > unsigned(b) then
            a_gr_b <= '1';
            a_eq_b <= '0';
            a_le_b <= '0';
        elsif unsigned(a) = unsigned(b) then
            a_gr_b <= '0';
            a_eq_b <= '1';
            a_le_b <= '0';
        else
            a_gr_b <= '0';
            a_eq_b <= '0';
            a_le_b <= '1';
        end if;
  end process;
end rtl;
