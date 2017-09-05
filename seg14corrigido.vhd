library ieee;
use ieee.std_logic_1164.all;

ENTITY seg14corrigido IS
PORT ( 
		entrada : in std_logic_vector (3 downto 0);
		s : out std_logic_vector (6 downto 0);
		s1 : out std_logic_vector (6 downto 0)
		);
		
	end seg14corrigido;
	
	architecture arq_seg14corrigido of seg14corrigido is
	begin
		with entrada select 
			s<= "1000000" when "0000",
				"1111001" when "0001",
				"0100100" when "0010",
				"0110000" when "0011",
				"0011001" when "0100",
				"0010010" when "0101",
				"0000010" when "0110",
				"1111000" when "0111",
				"0000000" when "1000",
				"0010000" when "1001",
				"1000000" when "1010",
				"1111001" when "1011",
				"0100100" when "1100",
				"0110000" when "1101",
				"0011001" when "1110",
				"0010010" when "1111",
				"0000001" when others;
		
		with entrada select		
		 s1<= "1111001" when "1010",
				"1111001" when "1011",
				"1111001" when "1100",
				"1111001" when "1101",
				"1111001" when "1110",
				"1111001" when "1111",
				"1000000" when others;
				
		end arq_seg14corrigido;