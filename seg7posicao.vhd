library ieee;
use ieee.std_logic_1164.all;

ENTITY seg7posicao IS
PORT ( 
		entrada : in std_logic_vector (2 downto 0);
		s : out std_logic_vector (6 downto 0)
	
		);
		
	end seg7posicao;
	
	architecture arq_seg7posicao of seg7posicao is
	begin
		with entrada select 
			s<= "1000000" when "000",
				"1111001" when "001",
				"0100100" when "010",
				"0110000" when "011",
				"0011001" when "100",
				"0010010" when "101",
				"0000010" when "110",
				"1111000" when "111",
				"0000001" when others;
		
				
		end arq_seg7posicao;