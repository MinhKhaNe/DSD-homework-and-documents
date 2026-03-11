library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 
entity testbench is

end testbench; 

architecture tb of testbench is

component decoder3to8
        port(
            A      : in  std_logic_vector(2 downto 0);
            Enable : in  std_logic;
            Y      : out std_logic_vector(7 downto 0)
        );
    end component;

    signal A      : std_logic_vector(2 downto 0);
    signal Enable : std_logic;
    signal Y      : std_logic_vector(7 downto 0);
    
begin
    DUT: decoder3to8 port map(A => A, Enable => Enable, Y => Y);

    process
    begin
     
        Enable <= '1';
        for i in 0 to 7 loop
            A <= std_logic_vector(to_unsigned(i, 3));
            wait for 10 ns;
        end loop;
        
        Enable <= '0';
        for i in 0 to 7 loop
            A <= std_logic_vector(to_unsigned(i, 3));
            wait for 10 ns;
        end loop;

        wait;
    end process;
end tb;
