library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 
entity testbench is

end testbench; 

architecture tb of testbench is
    component bin2gray_3bit
        port(
            bin  : in  std_logic_vector(2 downto 0);
            gray : out std_logic_vector(2 downto 0)
        );
    end component;

    signal bin  : std_logic_vector(2 downto 0);
    signal gray : std_logic_vector(2 downto 0);
begin
    DUT: bin2gray_3bit port map(bin => bin, gray => gray);

    process
    begin
        for i in 0 to 7 loop
            bin <= std_logic_vector(to_unsigned(i, 3));
            wait for 10 ns;
        end loop;
        wait;
    end process;
end tb;
