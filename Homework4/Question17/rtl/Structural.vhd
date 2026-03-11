library IEEE;
use IEEE.std_logic_1164.all;


entity half_subtractor is
    port(
        A, B : in  std_logic;
        D, B_out : out std_logic
    );
end half_subtractor;

architecture dataflow of half_subtractor is
begin
    D <= A xor B;
    B_out <= (not A) and B;
end dataflow;


entity full_subtractor_structural is
    port(
        A, B, Bin : in  std_logic;
        Diff, Bout : out std_logic
    );
end full_subtractor_structural;

architecture structural of full_subtractor_structural is
    signal D1, B1, B2 : std_logic;

    component half_subtractor
        port(
            A, B : in  std_logic;
            D, B_out : out std_logic
        );
    end component;
begin
    
    HS1: half_subtractor port map(A => A, B => B, D => D1, B_out => B1);

    HS2: half_subtractor port map(A => D1, B => Bin, D => Diff, B_out => B2);

    Bout <= B1 or B2;
end structural;
