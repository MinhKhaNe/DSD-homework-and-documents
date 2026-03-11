library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 
entity testbench is

end testbench; 

architecture tb of testbench is

component parity_4bit is
port(
   a		: in  std_logic_vector(3 downto 0);
  parity	: out std_logic);
end component;

signal a		: std_logic_vector(3 downto 0);
signal parity	: std_logic;

begin

  DUT: parity_4bit port map(a, parity);

  process
  begin
    for i in 0 to 15 loop
            a <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
    end loop;
   

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
