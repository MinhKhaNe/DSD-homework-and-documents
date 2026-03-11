library IEEE;
use IEEE.std_logic_1164.all;

entity ring_counter_behav is
    port(
        clk, reset : in  std_logic;
        q          : out std_logic_vector(3 downto 0)
    );
end ring_counter_behav;

architecture behavioral of ring_counter_behav is
    signal count : std_logic_vector(3 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            count <= "1000"; 
        elsif rising_edge(clk) then
            count <= count(2 downto 0) & count(3);
        end if;
    end process;
    q <= count;
end behavioral;

library IEEE;
use IEEE.std_logic_1164.all;

entity ring_counter_dataflow is
    port(
        clk, reset : in  std_logic;
        q          : out std_logic_vector(3 downto 0)
    );
end ring_counter_dataflow;

architecture dataflow of ring_counter_dataflow is
    signal temp : std_logic_vector(3 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            temp <= "1000";
        elsif rising_edge(clk) then
            temp <= temp(2 downto 0) & temp(3); 
        end if;
    end process;

    q <= temp;
end dataflow;


library IEEE;
use IEEE.std_logic_1164.all;

entity dff is
    port(
        clk, reset, d : in std_logic;
        q             : out std_logic
    );
end dff;

architecture rtl of dff is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            q <= '0'; 
        elsif rising_edge(clk) then
            q <= d;
        end if;
    end process;
end rtl;


library IEEE;
use IEEE.std_logic_1164.all;

entity ring_counter_structural is
    port(
        clk, reset : in std_logic;
        q          : out std_logic_vector(3 downto 0)
    );
end ring_counter_structural;

architecture structural of ring_counter_structural is
    component dff
        port(clk, reset, d: in std_logic; q: out std_logic);
    end component;

    signal q_int : std_logic_vector(3 downto 0) := "1000";
	signal d_int : std_logic_vector(3 downto 0) := "0000";

begin
    gen_ff: for i in 0 to 3 generate
        FF: dff port map(
            clk => clk,
            reset => reset,
            d => d_int(i),
            q => q_int(i)
        );
    end generate;

    d_int(0) <= q_int(3);
    d_int(1) <= q_int(0);
    d_int(2) <= q_int(1);
    d_int(3) <= q_int(2);

    q <= q_int;

end structural;
