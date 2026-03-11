library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter4_behav is
    port(
        clk, reset : in  std_logic;
        q          : out std_logic_vector(3 downto 0)
    );
end counter4_behav;

architecture behavioral of counter4_behav is
    signal count : unsigned(3 downto 0) := (others => '0');
begin
    process(clk, reset)
    begin
        if reset = '1' then
            count <= (others => '0');   
        elsif rising_edge(clk) then
            count <= count + 1;
        end if;
    end process;

    q <= std_logic_vector(count);
end behavioral;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter4_dataflow is
    port(
        clk, reset : in  std_logic;
        q          : out std_logic_vector(3 downto 0)
    );
end counter4_dataflow;

architecture dataflow of counter4_dataflow is
    signal count : unsigned(3 downto 0) := (others => '0');
begin
    process(clk, reset)
    begin
        if reset = '1' then
            count <= (others => '0');
        elsif rising_edge(clk) then
            count <= count + 1;
        end if;
    end process;

    q <= std_logic_vector(count);
end dataflow;

library IEEE;
use IEEE.std_logic_1164.all;

entity dff is
    port(
        clk, reset, d : in  std_logic;
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
use IEEE.numeric_std.all;

entity counter4_structural is
    port(
        clk, reset : in  std_logic;
        q          : out std_logic_vector(3 downto 0)
    );
end counter4_structural;

architecture structural of counter4_structural is
    component dff
        port(
            clk, reset, d : in  std_logic;
            q             : out std_logic
        );
    end component;

    signal d_int, q_int : std_logic_vector(3 downto 0);
begin
    process(q_int)
        variable temp : unsigned(3 downto 0);
    begin
        temp := unsigned(q_int) + 1;
        d_int <= std_logic_vector(temp);
    end process;

    gen_ff: for i in 0 to 3 generate
        FF: dff port map(clk => clk, reset => reset, d => d_int(i), q => q_int(i));
    end generate;

    q <= q_int;
end structural;
