architecture structural of mux2to1_2bit is
    component mux2to1_1bit
        port(
            A, B, Sel_n : in  std_logic;
            Y           : out std_logic
        );
    end component;
begin
    bit0: mux2to1_1bit port map(A(0), B(0), Sel_n, Y(0));
    bit1: mux2to1_1bit port map(A(1), B(1), Sel_n, Y(1));
end structural;


library IEEE;
use IEEE.std_logic_1164.all;

entity mux2to1_1bit is
    port(
        A, B, Sel_n : in  std_logic;
        Y           : out std_logic
    );
end mux2to1_1bit;

architecture logic of mux2to1_1bit is
begin
    Y <= (A and not Sel_n) or (B and Sel_n);
end logic;
