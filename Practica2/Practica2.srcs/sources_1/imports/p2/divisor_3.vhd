library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity divisor_3 is
    Port (
        clk : in STD_LOGIC;
        ena : in STD_LOGIC;
        f_div_2_5 : out STD_LOGIC;
        f_div_1_25 : out STD_LOGIC;
        f_div_500 : out STD_LOGIC
    );
end divisor_3;

architecture Behavioral of divisor_3 is
    signal count4 : unsigned(1 downto 0) := (others => '0');
    signal count2 : unsigned(2 downto 0) := (others => '0');
    signal count5 : unsigned(4 downto 0) := (others => '0');

    signal pulse_div4 : std_logic;
begin

    process(clk, ena)
    begin
        if ena = '0' then
            count4 <= (others => '0');
            count2 <= (others => '0');
            count5 <= (others => '0');
            pulse_div4 <= '0';
            f_div_2_5 <= '1';
            f_div_1_25 <= '1';
            f_div_500 <= '1';
        elsif rising_edge(clk) then
            if count4 = 3 then
                count4 <= (others => '0');
                f_div_2_5 <= '1';
            else
                count4 <= count4 + 1;
                f_div_2_5 <= '0'; 
            end if;

                if count2 = 7 then
                    count2 <= (others => '0');
                    f_div_1_25 <= '1';
                else
                    count2 <= count2 + 1;
                    f_div_1_25 <= '0';
                end if;

        if count5 = 19 then
            count5 <= (others => '0');
             f_div_500 <= '1';
        else
            count5 <= count5 + 1;
             f_div_500 <= '0';
        end if;

        end if;
    end process;

end Behavioral;