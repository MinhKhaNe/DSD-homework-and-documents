library IEEE;
use IEEE.std_logic_1164.all;

entity gray2bin_structural is
    port(
        gray : in  std_logic_vector(2 downto 0);
        bin  : out std_logic_vector(2 downto 0)
    );
end gray2bin_structural;

architecture structural of gray2bin_structural is
    signal b2, b1, b0 : std_logic;
begin
    b2 <= gray(2);
    b1 <= b2 xor gray(1);
    b0 <= b1 xor gray(0);
    bin <= b2 & b1 & b0;
end structural;
