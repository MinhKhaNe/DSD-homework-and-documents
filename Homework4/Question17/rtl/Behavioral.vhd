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
        case (A & B & Bin) is
            when "000" => Diff <= '0'; Bout <= '0';
            when "001" => Diff <= '1'; Bout <= '1';
            when "010" => Diff <= '1'; Bout <= '1';
            when "011" => Diff <= '0'; Bout <= '1';
            when "100" => Diff <= '1'; Bout <= '0';
            when "101" => Diff <= '0'; Bout <= '0';
            when "110" => Diff <= '0'; Bout <= '1';
            when "111" => Diff <= '1'; Bout <= '1';
            when others => Diff <= 'X'; Bout <= 'X';
        end case;
    end process;
end rtl;
