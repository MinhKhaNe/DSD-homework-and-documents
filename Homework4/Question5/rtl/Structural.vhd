library IEEE;
use IEEE.std_logic_1164.all;


entity half_adder is
  port(
    a, b : in std_logic;
    sum, cout : out std_logic
  );
end entity;

architecture rtl of half_adder is
begin
  sum  <= a xor b;
  cout <= a and b;
end architecture;


entity full_adder is
  port(
    a, b, cin : in std_logic;
    sum, cout : out std_logic
  );
end entity;

architecture rtl of full_adder is
  signal s1, c1, c2 : std_logic;
begin
  -- dùng hai half adder
  HA1: entity work.half_adder port map(a, b, s1, c1);
  HA2: entity work.half_adder port map(s1, cin, sum, c2);
  cout <= c1 or c2;
end architecture;


entity half_adder_subtractor is
  port(
    a, b : in std_logic_vector(1 downto 0);
    ctrl : in std_logic;  -- 0 = add, 1 = subtract
    sum  : out std_logic_vector(1 downto 0);
    cout : out std_logic
  );
end entity;

architecture structural of half_adder_subtractor is
  signal b_mod  : std_logic_vector(1 downto 0);
  signal c0, c1 : std_logic;
begin
  b_mod(0) <= b(0) xor ctrl;
  b_mod(1) <= b(1) xor ctrl;

  FA0: entity work.full_adder
    port map(
      a => a(0),
      b => b_mod(0),
      cin => ctrl,     
      sum => sum(0),
      cout => c0
    );

  FA1: entity work.full_adder
    port map(
      a => a(1),
      b => b_mod(1),
      cin => c0,
      sum => sum(1),
      cout => c1
    );

  cout <= c1;
end architecture;
