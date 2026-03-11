library IEEE;
use IEEE.std_logic_1164.all;

entity nand_gate is
  port(
    a: in std_logic;
    b: in std_logic;
    q: out std_logic
  );
end nand_gate;

architecture structural of nand_gate is
  component and2
    port(
      x, y: in std_logic;
      z: out std_logic
    );
  end component;

  component not1
    port(
      x: in std_logic;
      z: out std_logic
    );
  end component;

  for all : and2 use entity work.and2(rtl);
  for all : not1 use entity work.not1(rtl);

  signal temp: std_logic;

begin
  u1: and2 port map(x => a, y => b, z => temp);
  u2: not1 port map(x => temp, z => q);
end structural;
