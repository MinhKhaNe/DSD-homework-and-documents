library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
end testbench;

architecture tb of testbench is
    component comparator_4bit
        port(
            A, B     : in  std_logic_vector(3 downto 0);
            a_eq_b   : out std_logic;
            a_gr_b   : out std_logic;
            a_le_b   : out std_logic
        );
    end component;

    signal A, B     : std_logic_vector(3 downto 0);
    signal a_eq_b, a_gr_b, a_le_b : std_logic;
begin
    DUT: comparator_4bit port map(A, B, a_eq_b, a_gr_b, a_le_b);

    process
    begin
        for i in 0 to 15 loop
            for j in 0 to 15 loop
                A <= std_logic_vector(to_unsigned(i, 4));
                B <= std_logic_vector(to_unsigned(j, 4));
                wait for 10 ns;
            end loop;
        end loop;
        wait;
    end process;
end tb;
