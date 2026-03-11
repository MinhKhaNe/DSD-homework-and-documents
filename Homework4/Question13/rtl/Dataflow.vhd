library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity comparator_4bit is
    port(
        A, B     : in  std_logic_vector(3 downto 0);
        a_eq_b   : out std_logic;
        a_gr_b   : out std_logic;
        a_le_b   : out std_logic
    );
end comparator_4bit;

architecture rtl of comparator_4bit is
    signal A_int, B_int : unsigned(3 downto 0);
begin
    A_int <= unsigned(A);
    B_int <= unsigned(B);

    a_eq_b <= '1' when (A_int = B_int) else '0';
    a_gr_b <= '1' when (A_int > B_int) else '0';
    a_le_b <= '1' when (A_int < B_int) else '0';
end rtl;
