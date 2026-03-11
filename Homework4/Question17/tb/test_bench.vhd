library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture tb of testbench is
    component full_subtractor
        port(
            A, B, Bin : in  std_logic;
            Diff, Bout : out std_logic
        );
    end component;

    signal A, B, Bin, Diff, Bout : std_logic;
begin
    DUT: full_subtractor port map(A => A, B => B, Bin => Bin, Diff => Diff, Bout => Bout);

    process
    begin
        for i in 0 to 7 loop
            A   <= '0' when (i/4) mod 2 = 0 else '1';
            B   <= '0' when (i/2) mod 2 = 0 else '1';
            Bin <= '0' when (i) mod 2 = 0 else '1';
            wait for 10 ns;
        end loop;
        wait;
    end process;
end tb;
