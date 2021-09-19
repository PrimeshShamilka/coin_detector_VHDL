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

entity FSM_mealy_tb is
--  Port ( );
end FSM_mealy_tb;

architecture Behavioral of FSM_mealy_tb is

component FSM_mealy 
	Port (x: in std_logic;
    y: in std_logic;
    z: in std_logic;
    clk: in std_logic;
    p1: out std_logic;
    p2: out std_logic;
    p5: out std_logic);
end component;

-- Inputs
signal clk: std_logic := '0';
signal x: std_logic := '0';
signal y: std_logic := '0';
signal z: std_logic := '0';

-- Outputs
signal p1: std_logic;
signal p2: std_logic;
signal p5: std_logic;

-- Clock
constant clk_period : time := 0.5ns;

begin
-- Instantiate the Unit Under Test (UUT)
uut: FSM_mealy port map (
    x => x,
    y => y,
    z => z,
    clk => clk,
    p1 => p1,
    p2 => p2,
    p5 => p5
);

-- Clock process
clk_process: process
begin
    clk <= '1';
    wait for clk_period/2;
    clk <= '0';
    wait for clk_period/2;
end process;

-- Stimulus process
stim_process: process
begin
    wait for 10 ns;
    
    -- P1
    z <= '1';
    wait for 1 ns;
    z <= '0';
    wait for 10 ns;
    
    -- P5
    z <= '1';
    wait for 1 ns;
    y <= '1';
    wait for 1 ns;
    y <= '0';
    wait for 1 ns;
    z <= '0';
    wait for 10 ns;
    
    -- P2
    z <= '1';
    wait for 1 ns;
    y <= '1';
    wait for 1 ns;
    x <= '1';
    wait for 1 ns;
    x <= '0';
    wait for 1 ns;
    y <= '0';
    wait for 1 ns;
    z <= '0';
    
    wait;
end process;


end Behavioral;
