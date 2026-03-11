library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity comparator_4bit is
    port (
        a, b     : in  std_logic_vector(3 downto 0);
        a_eq_b   : out std_logic;
        a_le_b   : out std_logic;
        a_gr_b   : out std_logic
    );
end comparator_4bit;

architecture structural of comparator_4bit is
    component comparator_1bit
        port (
            a, b     : in  std_logic;
            a_eq_b   : out std_logic;
            a_le_b   : out std_logic;
            a_gr_b   : out std_logic
        );
    end component;

    signal eq : std_logic_vector(3 downto 0);
    signal le : std_logic_vector(3 downto 0);
    signal gr : std_logic_vector(3 downto 0);

begin
    bit0: comparator_1bit port map(a(0), b(0), eq(0), le(0), gr(0));
    bit1: comparator_1bit port map(a(1), b(1), eq(1), le(1), gr(1));
    bit2: comparator_1bit port map(a(2), b(2), eq(2), le(2), gr(2));
    bit3: comparator_1bit port map(a(3), b(3), eq(3), le(3), gr(3));

    a_eq_b <= eq(3) and eq(2) and eq(1) and eq(0);

    a_gr_b <= gr(3) or
              (eq(3) and gr(2)) or
              (eq(3) and eq(2) and gr(1)) or
              (eq(3) and eq(2) and eq(1) and gr(0));

    a_le_b <= le(3) or
              (eq(3) and le(2)) or
              (eq(3) and eq(2) and le(1)) or
              (eq(3) and eq(2) and eq(1) and le(0));
end structural;
