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

entity FSM_mealy_one_hot is
	Port (x: in std_logic;
		y: in std_logic;
		z: in std_logic;
		clk: in std_logic;
		p1: out std_logic;
		p2: out std_logic;
		p5: out std_logic);
end FSM_mealy_one_hot;

architecture Behavioral of FSM_mealy_one_hot is   
Signal state: std_logic_vector (6 downto 0);

begin

process(clk)
begin
if rising_edge(clk) then
    state <= "0000001";
    case state is
 
        when "0000001" =>
            p1 <= '0';
            p2 <= '0';
            p5 <= '0';
            if (z='1') then
                state <= "0000010";
            else
                state <= "0000001";
            end if;
            
        when "0000010" =>
            if (z='0') then
                p1 <= '1';
                state <= "0000001";
            elsif (y='1') then
                state <= "0000100";
            else
                state <= "0000010";
            end if;
            
         when "0000100" =>
            if (y='0') then
                state <= "0001000";
            elsif (x='1') then
                state <= "0010000";
            else
                state <= "0000100";
            end if;
            
         when "0001000" =>
            if (z='0') then
                p5 <= '1';
                state <= "0000001";
            else
                state <= "0001000";
            end if;
            
         when "0010000" =>
            if (x='0') then
                state <= "0100000";
            else
                state <= "0010000";
            end if;
            
         when "0100000" =>
            if (y='0') then 
                state <= "1000000";
            else
                state <= "0100000";
            end if;
            
          when "1000000" =>
            if (z='0') then
                p2 <= '1';
                state <= "0000001";
            else
                state <= "1000000";
            end if;
         when others =>
                state <= "0000001";
  
    end case;
end if;
end process; 

end Behavioral;
