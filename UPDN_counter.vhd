library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UPDN_counter is 
generic(N: integer:=4);
port(RESET, CLK, COUNT, UPDN: in bit; 
		V: out std_logic_vector(N-1 downto 0);
end entity;

architecture struct of UPDN_counter is
begin

	process(CLK, RESET) begin
		if RESET = '1' then
			