library IEEE;
use IEEE.std_logic_1164.all;

entity full_subtractor is
    port(
        A, B, Bin : in  std_logic;  
        Diff, Bout : out std_logic  
    );
end full_subtractor;

architecture rtl of full_subtractor is
begin
    process(A, B, Bin)
    begin
        Diff <= A xor B xor Bin;
    	Bout <= ((not A) and B) or ((not (A xor B)) and Bin);
    end process;
end rtl;
