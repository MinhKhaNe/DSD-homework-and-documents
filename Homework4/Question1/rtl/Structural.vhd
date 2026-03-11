library IEEE;
use IEEE.std_logic_1164.all;

entity input_and_gate is
  port(
    a: in std_logic;
    b: in std_logic;
    c: in std_logic;
    q: out std_logic
  );
end input_and_gate;

architecture structural of input_and_gate is
  component and2
    port(
      x, y: in std_logic;
      z: out std_logic
    );
  end component;

  for all : and2 use entity work.and2(rtl);

  signal temp: std_logic;
begin
  u1: and2 port map(x => a, y => b, z => temp);
  u2: and2 port map(x => temp, y => c, z => q);
end structural;
