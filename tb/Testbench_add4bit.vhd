----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/27/2018 12:41:23 PM
-- Design Name: 
-- Module Name: Testbench_add4bit - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Testbench_add4bit is
end Testbench_add4bit;

architecture Behavioral of Testbench_add4bit is

component add4bit
    port(
        clk:  in std_logic;
            cin : in std_logic;
            a,b : in Std_Logic_Vector(3 downto 0);   
            
            sum : out Std_Logic_Vector(3 downto 0);
            Cout: out Std_Logic 
    
        );

end component;

--for U1: add4bit use entity WORK.add4bit(STRUCTURE);
    signal cin : STD_LOGIC := '0'; 
--	signal number1, number2		: STD_LOGIC_VECTOR(3 downto 0)  :="0000";
    signal number1  :  integer  range 0 to 15 := 0;
    signal number2  :  integer  range 0 to 15 := 0;
    signal clk :      std_logic := '0';
    signal output1   : std_logic_vector(3 downto 0) := ( others => '0' );
    signal output2   : std_logic_vector(3 downto 0) := ( others => '0' );
	signal ans		: STD_LOGIC_VECTOR(3 downto 0) := ( others => '0' );
	signal cout		: STD_LOGIC :='0' ;

type t_integers is array ( natural range <>  ) of integer;
constant test1: t_integers( 7 downto 0 ) := ( 3, 7, 0, 4, 5, 2, 5, 3 );
constant test2: t_integers( 7 downto 0 ) := ( 1, 2, 3, 4, 5, 6, 7, 8 );
signal k: integer := 0;

BEGIN

UUT: add4bit PORT MAP (
 cin => cin,
 a => output1,
 b => output2,
 clk => clk,
 sum => ans,
 Cout => cout

 );

cin <= '0';
clk <= not clk after 10 ns;

process ( clk ) is
begin
if rising_edge( clk ) then

    k <= k + 1;

    output1 <= std_logic_vector( to_unsigned( test1( k ), 4 ) );
    output2 <=  std_logic_vector( to_unsigned( test2( k ), 4 ) );

    if k= 7 then
        k <= 0;
    end if;

end if;
end process;
 

END;