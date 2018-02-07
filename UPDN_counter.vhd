library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UPDN_counter is 
generic(N: integer:=4);
port(RESET, CLK, COUNT, UPDN: in bit; V: out unsigned(N-1 downto 0));
end entity UPDN_counter;

architecture struct of UPDN_counter is
signal Q: unsigned(N-1 downto 0);
signal Qn: unsigned(N downto 0);
constant c: integer := 1;
begin

	process(CLK, RESET) begin
		if RESET = '1' then
			Q <= (others => '0');
		elsif CLK'event and CLK = '1' then
			if UPDN = '0' then
				Qn <= ('0' & Q) + c;
			else
				Qn <= ('0' & Q) - c;
			end if;
		end if;
		
		if COUNT = '0' then
			V <= Q(N-1 downto 0);
		else
			V <= Qn(N-1 downto 0);
		end if;
		
	end process;
end architecture struct;
			