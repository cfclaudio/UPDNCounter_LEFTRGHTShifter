library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UPDN_counter is 
generic(N: integer:=4);
port(RESET, CLK, COUNT, UPDN, SHIFT, LEFTRGHT: in bit; 
		V: out std_logic_vector(N-1 downto 0));
end entity UPDN_counter;

architecture struct of UPDN_counter is
signal Q: unsigned(N-1 downto 0);
begin
	process(CLK, RESET) begin
		if RESET = '1' then
			Q <= (others => '0');
		elsif (CLK'event and CLK = '1') then
			if COUNT = '1' then
				if UPDN = '1' then	-- count up
					Q <= Q + 1;
				else
					Q <= Q - 1;			-- count down
				end if;
			end if;
			if SHIFT = '1' then
				if LEFTRGHT = '1' then
					Q <= '0' & Q(N-1 downto 1); -- shift right
				else
					Q <= Q(N-2 downto 0) & '0'; -- shift left
				end if;
			end if;
		end if;
	end process;
	V <= std_logic_vector(Q);
end architecture struct;
			