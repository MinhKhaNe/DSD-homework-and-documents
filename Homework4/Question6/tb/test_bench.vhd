library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 
entity testbench is

end testbench; 

architecture tb of testbench is

component comparator_4bit is
port(
  a, b: in  std_logic_vector(3 downto 0);
  a_eq_b: out std_logic;
  a_le_b: out std_logic;
  a_gr_b: out std_logic);
end component;

signal a, b: std_logic_vector(3 downto 0);
signal a_eq_b, a_le_b, a_gr_b: std_logic;

begin

  DUT: comparator_4bit port map(a, b, a_eq_b, a_le_b, a_gr_b);

  process
  begin
    a <= "0000";
    b <= "0000";
    wait for 1 ns;
    assert(a_eq_b='1') report "Fail 0/0" severity error;
    
    a <= "0001";
    b <= "0000";
    wait for 1 ns;
    assert(a_gr_b='1') report "Fail 0/0" severity error;
    
    b <= "0010";
    wait for 1 ns;
    assert(a_le_b='1') report "Fail 0/0" severity error;
    
    a <= "0111";
    b <= "1000";
    wait for 1 ns;
    assert(a_le_b='1') report "Fail 0/0" severity error;
    
    a <= "1111";
    b <= "1000";
    wait for 1 ns;
    assert(a_gr_b='1') report "Fail 0/0" severity error;
    
    a <= "0100";
    b <= "0111";
    wait for 1 ns;
    assert(a_le_b='1') report "Fail 0/0" severity error;
    
    a <= "1000";
    b <= "1000";
    wait for 1 ns;
    assert(a_eq_b='1') report "Fail 0/0" severity error;
    
    a <= "0000";
    b <= "0000";

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
