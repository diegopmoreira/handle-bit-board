library ieee;
use ieee.std_logic_1164.all;
--soma4eseg7--
entity s4_seg7 is
 port (
		a : in std_logic_vector (3 downto 0);
		b : in std_logic_vector (3 downto 0);
		c : out std_logic;
		s : out std_logic_vector (6 downto 0)	;
		s1 : out std_logic_vector (6 downto 0)		
		
 
 );
 end s4_seg7;
 
 architecture arq_s4_seg7 of s4_seg7 is
 SIGNAL sinal : std_logic_vector (3 downto 0);
 COMPONENT soma4_seg7
 port (
		entrada : in std_logic_vector (3 downto 0);
		s : out std_logic_vector (6 downto 0);
		s1 : out std_logic_vector (6 downto 0)
		);
		end COMPONENT;
		
	COMPONENT soma4 
	PORT(
  a, b: in std_logic_vector(3 downto 0);
  s: out std_logic_vector(3 downto 0);
  c4: out std_logic
  );
  end COMPONENT;
  begin
  entrada1 : soma4
  port map (a => a, b => b, c4 => c, s => sinal);
  --sinal conecta a saida do somador com a entrada do seg14--
  entrada2 : soma4_seg7
  port map (entrada => sinal, s => s, s1=>s1);
  --s é referente a unidade, e s1 é referente a dezena--
  end arq_s4_seg7;
  