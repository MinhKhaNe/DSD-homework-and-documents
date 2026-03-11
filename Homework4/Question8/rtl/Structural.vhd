library IEEE;
use IEEE.std_logic_1164.all;

entity decoder_2to4 is
    port(
        a : in  std_logic_vector(1 downto 0);
        y : out std_logic_vector(3 downto 0)
    );
end decoder_2to4;

architecture rtl of decoder_2to4 is
    component and2
        port(x, y: in std_logic; z: out std_logic);
    end component;

    component not1
        port(x: in std_logic; z: out std_logic);
    end component;

    signal a0n, a1n: std_logic;
begin
    n1: not1 port map(a(0), a0n);
    n2: not1 port map(a(1), a1n);

    g0: and2 port map(a1n, a0n, y(0));
    g1: and2 port map(a1n, a(0), y(1));
    g2: and2 port map(a(1), a0n, y(2));
    g3: and2 port map(a(1), a(0), y(3));
end structural;


library IEEE;
use IEEE.std_logic_1164.all;

entity and2 is
    port(x, y: in std_logic; z: out std_logic);
end and2;

architecture gate of and2 is
begin
    z <= x and y;
end gate;

entity not1 is
    port(x: in std_logic; z: out std_logic);
end not1;

architecture gate of not1 is
begin
    z <= not x;
end gate;
