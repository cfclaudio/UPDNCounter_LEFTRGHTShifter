library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LR_shifter is 
generic(N: integer:=4);
port(RESET, CLK, SHIFT, LEFTRGHT: in bit; 
		input_val: in std_logic_vector(N-1 downto 0);
		V: out std_logic_vector(N-1 downto 0));
end entity LR_shifter;

architecture struct of LR_shifter is
signal Q: unsigned(N-1 downto 0) := "0110";
begin
	process(CLK, RESET) begin
		if RESET = '1' then
			Q <= (others => '0');
		elsif (CLK'event and CLK = '1') then
			if SHIFT = '1' then
				if LEFTRGHT = '1' then 
					Q <= shift_right(Q, 1);
				else
					Q <= shift_left(Q, 1);
				end if;
			end if;
		end if;
	end process;
	V <= std_logic_vector(Q);
end architecture struct;
			