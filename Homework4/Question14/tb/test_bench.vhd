library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 
entity testbench is

end testbench; 

architecture tb of testbench is

component alu_2bit
        port(
            A, B  : in  std_logic_vector(1 downto 0);
            Sel   : in  std_logic_vector(1 downto 0);
            Result: out std_logic_vector(1 downto 0);
            Cout  : out std_logic
        );
    end component;

    signal A, B, Result : std_logic_vector(1 downto 0);
    signal Sel          : std_logic_vector(1 downto 0);
    signal Cout         : std_logic;
begin
    DUT: alu_2bit port map(A, B, Sel, Result, Cout);

    process
    begin
        for s in 0 to 3 loop  
            Sel <= std_logic_vector(to_unsigned(s, 2));
            for i in 0 to 3 loop  
                for j in 0 to 3 loop  
                    A <= std_logic_vector(to_unsigned(i, 2));
                    B <= std_logic_vector(to_unsigned(j, 2));
                    wait for 10 ns;
                end loop;
            end loop;
        end loop;
        wait;
    end process;
end tb;
