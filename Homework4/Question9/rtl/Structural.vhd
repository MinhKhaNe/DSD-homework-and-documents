architecture structural of priority_encoder_4to2 is
    component or2
        port(a, b: in std_logic; y: out std_logic);
    end component;

    component and2
        port(a, b: in std_logic; y: out std_logic);
    end component;

    component not1
        port(a: in std_logic; y: out std_logic);
    end component;

    signal n2, t1, t2, t3: std_logic;
begin
    n1: not1 port map(a => d(2), y => n2);

    o1: or2 port map(a => d(3), b => d(2), y => y(1));

    a1: and2 port map(a => n2, b => d(1), y => t1);
    o2: or2  port map(a => d(3), b => t1, y => y(0));

    o3: or2 port map(a => d(3), b => d(2), y => t2);
    o4: or2 port map(a => d(1), b => d(0), y => t3);
    o5: or2 port map(a => t2, b => t3, y => valid);
end structural;

entity and2 is port(a, b: in std_logic; y: out std_logic); end and2;
architecture rtl of and2 is begin y <= a and b; end rtl;

entity or2 is port(a, b: in std_logic; y: out std_logic); end or2;
architecture rtl of or2 is begin y <= a or b; end rtl;

entity not1 is port(a: in std_logic; y: out std_logic); end not1;
architecture rtl of not1 is begin y <= not a; end rtl;
