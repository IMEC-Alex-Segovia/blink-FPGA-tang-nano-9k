library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BIN_COUNT is
    Port(
        CLK : in STD_LOGIC;
        LEDS : out STD_LOGIC_VECTOR (5 downto 0)
    );
end BIN_COUNT;

architecture BIN_COUNT_ARCH of BIN_COUNT is

constant MAX_COUNT: integer := 13500000;
constant LED_MAX_COUNT: integer := 64;
signal COUNT : unsigned(23 downto 0) := (others => '0');
signal LED_COUNT : unsigned(5 downto 0) := (others => '0');

begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            if COUNT = MAX_COUNT - 1 then
                if LED_COUNT = LED_MAX_COUNT - 1 then
                    LED_COUNT <= (others => '0');
                else
                    LED_COUNT <= LED_COUNT + 1;
                end if;
                COUNT <= (others => '0');
            else
                COUNT <= COUNT + 1;
            end if;
        end if;
    end process;

    LEDS <= not STD_LOGIC_VECTOR(LED_COUNT);

end architecture;