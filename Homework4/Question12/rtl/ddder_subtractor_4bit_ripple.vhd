library IEEE;
use IEEE.std_logic_1164.all;


entity full_adder is
    port(
        A, B, Cin : in  std_logic;
        Sum, Cout : out std_logic
    );
end full_adder;

architecture behavioral of full_adder is
begin
    Sum  <= A xor B xor Cin;
    Cout <= (A and B) or (B and Cin) or (A and Cin);
end behavioral;


library IEEE;
use IEEE.std_logic_1164.all;

entity adder_subtractor_4bit is
    port(
        A, B  : in  std_logic_vector(3 downto 0);
        Sel   : in  std_logic;  
        Sum   : out std_logic_vector(3 downto 0);
        Cout  : out std_logic
    );
end adder_subtractor_4bit;

architecture structural of adder_subtractor_4bit is
    component full_adder
        port(
            A, B, Cin : in  std_logic;
            Sum, Cout : out std_logic
        );
    end component;

    signal B_mod : std_logic_vector(3 downto 0);
    signal carry : std_logic_vector(4 downto 0);
begin
    B_mod <= B xor (Sel & Sel & Sel & Sel);
    carry(0) <= Sel;

    FA0: full_adder port map(A(0), B_mod(0), carry(0), Sum(0), carry(1));
    FA1: full_adder port map(A(1), B_mod(1), carry(1), Sum(1), carry(2));
    FA2: full_adder port map(A(2), B_mod(2), carry(2), Sum(2), carry(3));
    FA3: full_adder port map(A(3), B_mod(3), carry(3), Sum(3), carry(4));

    Cout <= carry(4);
end structural;
