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
        if (Enable = '1') then
            case A is
                when "000" => Y <= "00000001";
                when "001" => Y <= "00000010";
                when "010" => Y <= "00000100";
                when "011" => Y <= "00001000";
                when "100" => Y <= "00010000";
                when "101" => Y <= "00100000";
                when "110" => Y <= "01000000";
                when "111" => Y <= "10000000";
                when others => Y <= (others => '0');
            end case;
        else
            Y <= (others => '0');
        end if;
    end process;
end rtl;
