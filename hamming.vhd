library ieee;
use ieee.std_logic_1164.all;

ENTITY hamming IS
  PORT(
  a : in std_logic_vector(3 downto 0);
  s: out std_logic_vector(6 downto 0)
  
  );
end hamming;
architecture arq_hamming of hamming is
	begin
	s(6) <= a(3) xor a(2) xor a(0);
	s(5) <= a(3) xor a(1) xor a(0);
	s(4) <= a(3);
	s(3) <= a(2) xor a(1) xor a(0);
	s(2) <= a(2);
	s(1) <= a(1);
	s(0) <= a(0);
 	
end arq_hamming;