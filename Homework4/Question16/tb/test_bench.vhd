library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 
entity testbench is

end testbench; 

architecture tb of testbench is

component mux2to1_2bit
        port(
            A, B   : in  std_logic_vector(1 downto 0);
            Sel_n  : in  std_logic;
            Y      : out std_logic_vector(1 downto 0)
        );
    end component;

    signal A, B, Y  : std_logic_vector(1 downto 0);
    signal Sel_n    : std_logic;
begin
    DUT: mux2to1_2bit port map(A, B, Sel_n, Y);

    process
    begin
        for s in 0 to 1 loop  
            if s = 0 then
    			Sel_n <= '0';
            else
    			Sel_n <= '1';
			end if;

            for i in 0 to 3 loop  
                A <= std_logic_vector(to_unsigned(i, 2));
                for j in 0 to 3 loop  
                    B <= std_logic_vector(to_unsigned(j, 2));
                    wait for 10 ns;
                end loop;
            end loop;
        end loop;
        wait;
    end process;
end tb;
