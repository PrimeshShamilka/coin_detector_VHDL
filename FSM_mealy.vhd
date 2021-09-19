----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/17/2021 10:19:06 PM
-- Design Name: 
-- Module Name: FSM_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM_mealy is
	Port (x: in std_logic;
		y: in std_logic;
		z: in std_logic;
		clk: in std_logic;
		p1: out std_logic;
		p2: out std_logic;
		p5: out std_logic);
end FSM_mealy;

architecture Behavioral of FSM_mealy is
Type State_type is (A, B, C, D, E, F, G);    
Signal state: State_type;

begin

process(clk)
begin
if rising_edge(clk) then
    state <= A;
    case state is
 
        when A =>
            p1 <= '0';
            p2 <= '0';
            p5 <= '0';
            if (z='1') then
                state <= B;
            else
                state <= A;
            end if;
            
        when B =>
            if (z='0') then
                p1 <= '1';
                state <= A;
            elsif (y='1') then
                state <= C;
            else
                state <= B;
            end if;
            
         when C =>
            if (y='0') then
                state <= D;
            elsif (x='1') then
                state <= E;
            else
                state <= C;
            end if;
            
         when D =>
            if (z='0') then
                p5 <= '1';
                state <= A;
            else
                state <= D;
            end if;
            
         when E =>
            if (x='0') then
                state <= F;
            else
                state <= E;
            end if;
            
         when F =>
            if (y='0') then 
                state <= G;
            else
                state <= F;
            end if;
            
          when G =>
            if (z='0') then
                p2 <= '1';
                state <= A;
            else
                state <= G;
            end if;
            
    end case;
end if;
end process; 

end Behavioral;
