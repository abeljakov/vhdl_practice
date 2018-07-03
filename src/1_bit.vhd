----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/26/2018 04:37:29 PM
-- Design Name: 
-- Module Name: 1_bit - Behavioral
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
 
entity full_adder_vhdl_code is
 Port (
 clk: in STD_Logic;
  A : in STD_LOGIC;
 B : in STD_LOGIC;
 Cin : in STD_LOGIC;
 S : out STD_LOGIC;
 Cout : out STD_LOGIC);

end;


 
architecture rtl of full_adder_vhdl_code is

begin
     --P1:process(clk)
--       P1:process   
     --begin 
--         if rising_edge(clk) then
             S <= A XOR B XOR Cin ;
             Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B);
  --        end if;  
    -- end process P1;        
end; 