
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
 
entity full_adder_vhdl_codeTB is
end;

architecture rtl of full_adder_vhdl_codeTB is
 
component full_adder_vhdl_code
port (
    clk: in STD_Logic;
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    Cin : in STD_LOGIC;
    S : out STD_LOGIC;
    Cout : out STD_LOGIC
);
end component;


 


signal clk, s, cout, a, b, cin:std_logic := '0';
type t_test is array ( natural range <> ) of  std_logic_vector( 2 downto 0 );
constant test: t_test( 7 downto 0 ) := ( "111", "110", "101", "100", "010", "011", "001", "000" );
signal k: integer := 0;

begin

clk <= not clk after 5 ns;

c: full_adder_vhdl_code port map (
    clk, a, b, cin, s, cout
);

process(clk) 
begin 
    if rising_edge(clk) then
    
         k <= k + 1;
         
         a <= test( k )( 0 );
         b <= test( k )( 1 );
         cin <= test( k )( 2 );
         
         if k = 7 then
            k <= 0;
        end if;
         
    end if;  
end process;        
end; 