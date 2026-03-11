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
    Y <= (A and (not Sel_n & not Sel_n)) or (B and (Sel_n & Sel_n));
end rtl;
