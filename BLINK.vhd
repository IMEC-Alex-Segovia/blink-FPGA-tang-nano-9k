library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BLINK is
    Port(
        CLK : in STD_LOGIC;
        LED_10 : out STD_LOGIC;
        LED_11 : out STD_LOGIC
    );
end BLINK;

architecture BLINK_ARCH of BLINK is

constant MAX_COUNT : integer := 13500000;
signal COUNT : unsigned(23 downto 0) := (others => '0');
signal LED_10_STATE : STD_LOGIC := '0';
signal LED_11_STATE : STD_LOGIC := '1';

begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            if COUNT = MAX_COUNT - 1 then
                COUNT <= (others => '0');
                LED_10_STATE <= not LED_10_STATE;
                LED_11_STATE <= not LED_11_STATE;
            else
                COUNT <= COUNT + 1;
            end if;
        end if;
    end process;

    LED_10 <= LED_10_STATE;
    LED_11 <= LED_11_STATE;

end BLINK_ARCH;