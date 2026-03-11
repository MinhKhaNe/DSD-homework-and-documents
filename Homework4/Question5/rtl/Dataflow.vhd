library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity half_adder_subtractor is
    port(
        a     : in  std_logic_vector(1 downto 0);
        b     : in  std_logic_vector(1 downto 0);
        ctrl  : in  std_logic;  
        sum   : out std_logic_vector(1 downto 0);
        cout  : out std_logic
    );
end half_adder_subtractor;

architecture rtl of half_adder_subtractor is
begin
    process(a, b, ctrl)
        variable b_mod : unsigned(1 downto 0);
        variable temp  : unsigned(2 downto 0);
    begin
        if ctrl = '0' then
            b_mod := unsigned(b);
        else
            b_mod := not unsigned(b);
        end if;

        temp := unsigned('0' & a) + unsigned('0' & b_mod) + ("00" & ctrl);

        sum  <= std_logic_vector(temp(1 downto 0));
        cout <= temp(2);
    end process;
end rtl;
