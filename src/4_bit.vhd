library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity add4bit is
port( 
      clk : in Std_logic;
      a	  : in STD_LOGIC_VECTOR(3 downto 0);
      b	  : in STD_LOGIC_VECTOR(3 downto 0);
      cin : in std_logic;
      sum : out	STD_LOGIC_VECTOR(3 downto 0);
      cout: out	STD_LOGIC	
 );
end;


architecture Behavioral of add4bit is

signal da, db, dsum: STD_LOGIC_VECTOR(3 downto 0) := ( others => '0' );
signal dcout: std_logic;

component full_adder_vhdl_code is
	port( clk, a, b, cin	: in  STD_LOGIC;
	      s, cout		: out STD_LOGIC );
end component;

--component full_adder_vhdl_code is
-- Port ( A : in STD_LOGIC;
-- B : in STD_LOGIC;
-- Cin : in STD_LOGIC;
-- S : out STD_LOGIC;
-- Cout : out STD_LOGIC);
--end component;


signal c : STD_LOGIC_vector( 4 downto 0 ) := ( others => '0' );

begin

c(0) <= cin;
dcout <= c(4);

g4bit: for k in 0 to 3 generate
c1Bitadder: full_adder_vhdl_code port map ( clk, da( k ), db( k ), c( k ), dsum( k ), c( k + 1 ) );
end generate;

--b_adder0: full_adder_vhdl_code port map (da(0), db(0), c0,clk, dsum(0), c1);
--b_adder1: full_adder_vhdl_code port map (da(1), db(1), c1,clk, dsum(1), c2);
--b_adder2: full_adder_vhdl_code port map (da(2), db(2), c2,clk, dsum(2), c3);
--b_adder3: full_adder_vhdl_code port map (da(3), db(3), c3,clk, dsum(3), dcout);

    process ( clk) is
    begin
    
        if rising_edge(clk) then
        
        -- step 1
          
            da <= a;
            db <= b;
            
            
        -- step 2
            
            sum <= dsum;
            cout <= dcout;
            
       end if;
    end process;

end Behavioral;
