architecture structural of bin2gray_3bit is
    component xor2
        port(
            a, b : in std_logic;
            y    : out std_logic
        );
    end component;

begin
    gray(2) <= bin(2);

    u1: xor2 port map(a => bin(2), b => bin(1), y => gray(1));

    u2: xor2 port map(a => bin(1), b => bin(0), y => gray(0));
end structural;

library IEEE;
use IEEE.std_logic_1164.all;

entity xor2 is
    port(
        a, b : in std_logic;
        y    : out std_logic
    );
end xor2;

architecture rtl of xor2 is
begin
    y <= a xor b;
end rtl;
