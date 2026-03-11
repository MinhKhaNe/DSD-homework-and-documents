library IEEE;
use IEEE.std_logic_1164.all;

entity mux2to1_2bit is
    port(
        A, B   : in  std_logic_vector(1 downto 0);  
        Sel_n  : in  std_logic;                     
        Y      : out std_logic_vector(1 downto 0)   
    );
end mux2to1_2bit;

architecture rtl of mux2to1_2bit is
begin
    process(A, B, Sel_n)
    begin
        if Sel_n = '0' then
            Y <= A;  
        else
            Y <= B;  
        end if;
    end process;
end rtl;
