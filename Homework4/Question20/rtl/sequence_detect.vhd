library IEEE;
use IEEE.std_logic_1164.all;

entity seq_detector is
    port(
        clk     : in  std_logic;
        reset   : in  std_logic;
        din     : in  std_logic;
        detected: out std_logic
    );
end seq_detector;

architecture behavioral of seq_detector is

    type state_type is (S0, S1, S2, S3, S4);
    signal state, next_state : state_type;

begin

    process(clk, reset)
    begin
        if reset = '1' then
            state <= S0;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    process(state, din)
    begin
        detected <= '0';  
        case state is
            when S0 =>
                if din = '1' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;
            when S1 =>
                if din = '0' then
                    next_state <= S2;
                else
                    next_state <= S1;
                end if;
            when S2 =>
                if din = '1' then
                    next_state <= S3;
                else
                    next_state <= S0;
                end if;
            when S3 =>
                if din = '1' then
                    next_state <= S4;
                    detected <= '1'; 
                else
                    next_state <= S2;
                end if;
            when S4 =>
                if din = '1' then
                    next_state <= S1;
                else
                    next_state <= S2;
                end if;
        end case;
    end process;

end behavioral;
