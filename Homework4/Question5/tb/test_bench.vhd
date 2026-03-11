library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 
entity testbench is

end testbench; 

architecture tb of testbench is

component half_adder_subtractor is
port(
  a: in std_logic_vector(1 downto 0);
  b: in std_logic_vector(1 downto 0);
  ctrl: in std_logic;
  sum: out std_logic_vector(1 downto 0);
  cout: out std_logic);
end component;

signal ctrl, cout: std_logic;
signal a, b, sum: std_logic_vector(1 downto 0);

begin

  DUT: half_adder_subtractor port map(a, b, ctrl, sum, cout);

  process
  begin
  	ctrl <= '0';
  
    a <= "00";
    b <= "00";
    wait for 1 ns;
    assert(sum="00" and cout='0') report "Fail: 00 + 00" severity error;
    
    a <= "01";
    b <= "01";
    wait for 1 ns;
    assert(sum="10" and cout='0') report "Fail: 01 + 01" severity error;
    
    a <= "10";
    b <= "11";
    wait for 1 ns;
    assert(sum="01" and cout='1') report "Fail: 10 + 11" severity error;
    
    a <= "11";
    b <= "11";
    wait for 1 ns;
    assert(sum="10" and cout='1') report "Fail: 11 + 11" severity error;
    
    ctrl <= '1';
  
    a <= "11";
    b <= "01";
    wait for 1 ns;
    assert(sum="10" and cout='0') report "Fail: 11 - 01" severity error;
    
    a <= "01";
    b <= "01";
    wait for 1 ns;
    assert(sum="10" and cout='0') report "Fail: 01 - 01" severity error;
    
    a <= "00";
    b <= "11";
    wait for 1 ns;
    assert(sum="01" and cout='1') report "Fail: 00 - 11 (borrow)" severity error;
    
    a <= "01";
    b <= "10";
    wait for 1 ns;
    assert(sum="11" and cout='1') report "Fail: 01 - 10 (borrow)" severity error;

    a <= "00";
    b <= "00";
    ctrl <= '0';

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
