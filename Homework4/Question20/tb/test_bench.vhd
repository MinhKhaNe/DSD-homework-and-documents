library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture tb of testbench is
    signal clk, reset, din : std_logic := '0';
    signal detected        : std_logic;

begin
   
    UUT: entity work.seq_detector
        port map(
            clk      => clk,
            reset    => reset,
            din      => din,
            detected => detected
        );

    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for 10 ns;
            clk <= '1';
            wait for 10 ns;
        end loop;
    end process;

    stim_proc: process
    begin
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        din <= '1'; wait for 20 ns;
        din <= '0'; wait for 20 ns;
        din <= '1'; wait for 20 ns;
        din <= '1'; wait for 20 ns;

        din <= '1'; wait for 20 ns;
        din <= '0'; wait for 20 ns;
        din <= '1'; wait for 20 ns;
        din <= '1'; wait for 20 ns; 

        din <= '0'; wait for 20 ns;
        din <= '1'; wait for 20 ns;
        din <= '0'; wait for 20 ns;
        din <= '1'; wait for 20 ns; 

        wait for 40 ns;
        assert false report "Simulation finished" severity failure;
    end process;

end tb;
