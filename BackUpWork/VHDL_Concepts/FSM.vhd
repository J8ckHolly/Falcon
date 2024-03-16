library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm is
    port(
        clk: in std_logic;
        nRst: in std_logic;
        NorthRed: out std_logic;
        NorthGreen: out std_logic;
        NorthYellow: out std_logic;
        WestRed: out std_logic;
        WestYellow: out std_logic;
        WestGreen: out std_logic;
    );
end entity;

architecture beh of fsm is
    type t_state is (NorthNext, StartNorth, North, StopNorth,
     WestNext, StartWest, West, StopWest);
     signal State : t_state;

begin
    process(clk) is
    begin
        if rising_edge(clk) then
            if nRst = '0' then
                --reset values
                State <= NorthNext;

            else
                case State is 
                    when NorthNext => State <= StartNorth;
                    when StartNorth => State <= North;
                    when North => State <= StopNorth;
                    when StopNorth => State <= WestNext;
                    when WestNext => State <= StartWest;
                    when StartWest => State <= West;
                    when West => State <= StopWest;
                    when StopWest => State <= NorthNext;
                end case;
            end if;
        end if;
    end process;
end architecture;