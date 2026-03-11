library IEEE;
use IEEE.std_logic_1164.all;

entity not1 is
  port(
    x: in std_logic;
    z: out std_logic
  );
end not1;

architecture rtl of not1 is
begin
  z <= not x;
end rtl;