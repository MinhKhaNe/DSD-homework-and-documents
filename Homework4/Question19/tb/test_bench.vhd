library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture tb of testbench is
    signal clk, reset       : std_logic := '0';
    signal q_behav, q_data, q_struct : std_logic_vector(3 downto 0);
begin

    U1: entity work.ring_counter_behav
        port map(clk => clk, reset => reset, q => q_behav);

    U2: entity work.ring_counter_dataflow
        port map(clk => clk, reset => reset, q => q_data);

    U3: entity work.ring_counter_structural
        port map(clk => clk, reset => reset, q => q_struct);

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
        wait for 200 ns;
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        wait for 100 ns;
        assert false report "Simulation finished" severity failure;
    end process;

end tb;
