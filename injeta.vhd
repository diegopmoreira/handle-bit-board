library ieee;
use ieee.std_logic_1164.all;

ENTITY injeta IS
	PORT (
	a : in std_logic_vector (6 downto 0);
	erro : in std_logic_vector (2 downto 0);
	saida : buffer std_logic_vector (6 downto 0)
	); 
	end injeta;
	architecture arq_injeta of injeta is
	SIGNAL aux : std_logic_vector (6 downto 0);
	begin 
	with erro select
	aux <= "0000001" when "111",
			 "0000010" when "110",
			 "0000100" when "101",
			 "0001000" when "100",
			 "0010000" when "011",
			 "0100000" when "010",
			 "1000000" when "001",
			 "0000000" when "000";
	saida <= a xor aux;
	
	end arq_injeta;
	