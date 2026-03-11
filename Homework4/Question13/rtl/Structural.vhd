library IEEE;
use IEEE.std_logic_1164.all;


entity comparator_1bit is
    port(
        A, B, eq_in, gr_in, le_in : in  std_logic;
        eq_out, gr_out, le_out    : out std_logic
    );
end comparator_1bit;

architecture logic of comparator_1bit is
begin
    process(A, B, eq_in, gr_in, le_in)
    begin
        if (A = B) then
            eq_out <= eq_in;
            gr_out <= gr_in;
            le_out <= le_in;
        elsif (A = '1' and B = '0') then
            eq_out <= '0';
            gr_out <= '1';
            le_out <= '0';
        else
            eq_out <= '0';
            gr_out <= '0';
            le_out <= '1';
        end if;
    end process;
end logic;


entity comparator_4bit_structural is
    port(
        A, B     : in  std_logic_vector(3 downto 0);
        a_eq_b   : out std_logic;
        a_gr_b   : out std_logic;
        a_le_b   : out std_logic
    );
end comparator_4bit_structural;

architecture structural of comparator_4bit_structural is
    component comparator_1bit
        port(
            A, B, eq_in, gr_in, le_in : in  std_logic;
            eq_out, gr_out, le_out    : out std_logic
        );
    end component;

    signal eq_chain, gr_chain, le_chain : std_logic_vector(4 downto 0);
begin

    eq_chain(0) <= '1';
    gr_chain(0) <= '0';
    le_chain(0) <= '0';

    bit3: comparator_1bit port map(A(3), B(3), eq_chain(0), gr_chain(0), le_chain(0),
                                   eq_chain(1), gr_chain(1), le_chain(1));
    bit2: comparator_1bit port map(A(2), B(2), eq_chain(1), gr_chain(1), le_chain(1),
                                   eq_chain(2), gr_chain(2), le_chain(2));
    bit1: comparator_1bit port map(A(1), B(1), eq_chain(2), gr_chain(2), le_chain(2),
                                   eq_chain(3), gr_chain(3), le_chain(3));
    bit0: comparator_1bit port map(A(0), B(0), eq_chain(3), gr_chain(3), le_chain(3),
                                   eq_chain(4), gr_chain(4), le_chain(4));

    a_eq_b <= eq_chain(4);
    a_gr_b <= gr_chain(4);
    a_le_b <= le_chain(4);
end structural;
