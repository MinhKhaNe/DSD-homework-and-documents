library IEEE;
use IEEE.std_logic_1164.all;

entity input_or_gate is
  port(
    a: in std_logic;
    b: in std_logic;
    c: in std_logic;
    q: out std_logic
  );
end input_or_gate;

architecture structural of input_or_gate is
  component or2
    port(
      x, y: in std_logic;
      z: out std_logic
    );
  end component;

  for all : or2 use entity work.or2(rtl);

  signal temp: std_logic;
begin
  u1: or2 port map(x => a, y => b, z => temp);
  u2: or2 port map(x => temp, y => c, z => q);
end structural;
