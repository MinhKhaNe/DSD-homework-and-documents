library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 
entity testbench is

end testbench; 

architecture tb of testbench is
    component priority_encoder_4to2
        port(
            d : in  std_logic_vector(3 downto 0);
            y : out std_logic_vector(1 downto 0);
            valid : out std_logic
        );
    end component;

    signal d : std_logic_vector(3 downto 0);
    signal y : std_logic_vector(1 downto 0);
    signal valid : std_logic;
begin
    DUT: priority_encoder_4to2
        port map(d => d, y => y, valid => valid);

    process
    begin
        d <= "0000"; wait for 10 ns;  
        d <= "0001"; wait for 10 ns;  
        d <= "0010"; wait for 10 ns;  
        d <= "0100"; wait for 10 ns;  
        d <= "1000"; wait for 10 ns; 
        d <= "1010"; wait for 10 ns; 
        d <= "0111"; wait for 10 ns; 
        wait;
    end process;
end tb;
