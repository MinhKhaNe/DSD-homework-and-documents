library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu_2bit is
port(
   		A      : in  std_logic_vector(2 downto 0);
        Enable : in  std_logic;
        Y      : out std_logic_vector(7 downto 0)
  );
end alu_2bit;

architecture rtl of alu_2bit is
signal temp : unsigned(2 downto 0); 
begin
    process(A, B, Sel)
    begin
        case Sel is
            when "00" =>  
                Result <= A and B;
                Cout <= '0';
            when "01" => 
                Result <= A or B;
                Cout <= '0';
            when "10" =>  
                Result <= A xor B;
                Cout <= '0';
            when "11" =>  
                temp   <= ('0' & unsigned(A)) + ('0' & unsigned(B));
                Result <= std_logic_vector(temp(1 downto 0));
                Cout   <= temp(2);
            when others =>
                Result <= (others => '0');
                Cout <= '0';
        end case;
    end process;
end rtl;
