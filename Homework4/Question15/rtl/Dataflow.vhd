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
signal temp : unsigned(2 downto 0); 
begin
    process(A, Enable)
    begin
        Y(0) <= Enable and (not A(2)) and (not A(1)) and (not A(0));
    	Y(1) <= Enable and (not A(2)) and (not A(1)) and A(0);
    	Y(2) <= Enable and (not A(2)) and A(1) and (not A(0));
        Y(3) <= Enable and (not A(2)) and A(1) and A(0);
        Y(4) <= Enable and A(2) and (not A(1)) and (not A(0));
        Y(5) <= Enable and A(2) and (not A(1)) and A(0);
    	Y(6) <= Enable and A(2) and A(1) and (not A(0));
   	Y(7) <= Enable and A(2) and A(1) and A(0);
    end process;
end rtl;
