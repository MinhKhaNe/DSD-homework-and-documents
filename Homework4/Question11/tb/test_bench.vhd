library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 
entity testbench is

end testbench; 

architecture tb of testbench is
    component gray2bin
        port(
            gray : in  std_logic_vector(2 downto 0);
            bin  : out std_logic_vector(2 downto 0)
        );
    end component;

    signal gray : std_logic_vector(2 downto 0);
    signal bin  : std_logic_vector(2 downto 0);
begin
    DUT: gray2bin port map(gray => gray, bin => bin);

    process
    begin
        for i in 0 to 7 loop
            gray <= std_logic_vector(to_unsigned(i, 3));
            wait for 10 ns;
        end loop;
        wait;
    end process;
end tb;
