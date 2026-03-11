library IEEE;
use IEEE.std_logic_1164.all;

entity parity_4bit is
    port(
        a       : in  std_logic_vector(3 downto 0);
        parity  : out std_logic
    );
end parity_4bit;

architecture structural of parity_4bit is
    component xor2
        port(
            x, y : in std_logic;
            z    : out std_logic
        );
    end component;

    signal t1, t2 : std_logic;
begin
    g1: xor2 port map(a(0), a(1), t1);
    g2: xor2 port map(a(2), a(3), t2);
    g3: xor2 port map(t1, t2, parity);
end structural;
