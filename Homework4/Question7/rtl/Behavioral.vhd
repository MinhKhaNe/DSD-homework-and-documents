library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity parity_4bit is
port(
  a		: in  std_logic_vector(3 downto 0);
  parity: out std_logic);
end parity_4bit;

architecture rtl of parity_4bit is
begin
  process(a) is
  variable count : integer := 0;
  begin
  	count := 0;
    for i in 0 to 3 loop
    	if a(i) = '1' then count := count + 1;
        end if;
    end loop;
    
    if (count mod 2 = 0) then
        parity <= '0';
    else
    	parity <= '1';
    end if;
  end process;
end rtl;
