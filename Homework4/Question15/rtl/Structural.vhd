library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity decoder3to8 is
port(
   		A      : in  std_logic_vector(2 downto 0);
        Enable : in  std_logic;
        Y      : out std_logic_vector(7 downto 0)
  );
end decoder3to8;

architecture rtl of decoder3to8 is
signal nA : std_logic_vector(2 downto 0);
begin
    nA(0) <= not A(0);
    nA(1) <= not A(1);
    nA(2) <= not A(2);

    Y(0) <= Enable and nA(2) and nA(1) and nA(0);
    Y(1) <= Enable and nA(2) and nA(1) and A(0);
    Y(2) <= Enable and nA(2) and A(1) and nA(0);
    Y(3) <= Enable and nA(2) and A(1) and A(0);
    Y(4) <= Enable and A(2) and nA(1) and nA(0);
    Y(5) <= Enable and A(2) and nA(1) and A(0);
    Y(6) <= Enable and A(2) and A(1) and nA(0);
    Y(7) <= Enable and A(2) and A(1) and A(0);
end rtl;
