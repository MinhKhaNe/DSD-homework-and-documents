library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_adder_subtractor_4bit is
end tb_adder_subtractor_4bit;

architecture test of tb_adder_subtractor_4bit is
    component adder_subtractor_4bit
        port(
            A, B  : in  std_logic_vector(3 downto 0);
            Sel   : in  std_logic;
            Sum   : out std_logic_vector(3 downto 0);
            Cout  : out std_logic
        );
    end component;

    signal A, B, Sum : std_logic_vector(3 downto 0);
    signal Sel, Cout : std_logic;
begin
    DUT: adder_subtractor_4bit port map(A => A, B => B, Sel => Sel, Sum => Sum, Cout => Cout);

    process
    begin
       
        Sel <= '0';
        for i in 0 to 5 loop
            A <= std_logic_vector(to_unsigned(i, 4));
            B <= std_logic_vector(to_unsigned(5 - i, 4));
            wait for 10 ns;
        end loop;

        Sel <= '1';
        for i in 0 to 5 loop
            A <= std_logic_vector(to_unsigned(i + 5, 4));
            B <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
        end loop;

        wait;
    end process;
end test;
