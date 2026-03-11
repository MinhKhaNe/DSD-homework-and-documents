library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 
entity testbench is

end testbench; 

architecture tb of testbench is
    component decoder_2to4
        port(
            a : in  std_logic_vector(1 downto 0);
            y : out std_logic_vector(3 downto 0)
        );
    end component;

    signal a : std_logic_vector(1 downto 0);
    signal y : std_logic_vector(3 downto 0);
begin
    DUT: decoder_2to4 port map(a, y);

    process
    begin
        for i in 0 to 3 loop
            a <= std_logic_vector(to_unsigned(i, 2));
            wait for 10 ns;
        end loop;
        wait;
    end process;
end tb;
