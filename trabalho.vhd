library ieee;
use ieee.std_logic_1164.all;


ENTITY trabalho IS
PORT (
		a : in std_logic_vector (3 downto 0);
		b: in std_logic_vector (3 downto 0);		
		s14r1 : out std_logic_vector (6 downto 0);
		s14r2 : out std_logic_vector (6 downto 0);
		s14c1 : out std_logic_vector (6 downto 0);
		s14c2 : out std_logic_vector (6 downto 0);
		s7p : out std_logic_vector (6 downto 0);
		erro : in std_logic_vector (2 downto 0);
		overflow : out std_logic;
		errodecod : out std_logic
		
);
 end trabalho;

architecture arq_trabalho of trabalho is
SIGNAL sinal1 : std_logic_vector (3 downto 0);
SIGNAL sinal2 : std_logic_vector (6 downto 0);
SIGNAL sinal3 : std_logic_vector (6 downto 0);
SIGNAL sinal4 : std_logic_vector (3 downto 0);
SIGNAL sinal5 : std_logic_vector (3 downto 0);
SIGNAL sinal6 : std_logic_vector (2 downto 0);

COMPONENT soma4 IS
	PORT(
  a, b: in std_logic_vector(3 downto 0);
  s: out std_logic_vector(3 downto 0);
  c4: out std_logic
  );
  end COMPONENT;
  
COMPONENT hamming IS
 PORT(
  a : in std_logic_vector(3 downto 0);
  s: out std_logic_vector(6 downto 0)
  );
  end COMPONENT;
  
COMPONENT injeta IS
PORT (
	a : in std_logic_vector (6 downto 0);
	erro : in std_logic_vector (2 downto 0);
	saida : buffer std_logic_vector (6 downto 0)
	); 
	end COMPONENT;
	
COMPONENT decodham IS
PORT (
	a : in std_logic_vector (6 downto 0);
	aout: out std_logic_vector (3 downto 0);
	erro : out std_logic;
	p : buffer std_logic_vector (2 downto 0);
	corrigido: buffer std_logic_vector (6 downto 0);
	corrigido4: out std_logic_vector (3 downto 0);
	posicao : out std_logic_vector(2 downto 0)
	
);
end COMPONENT; 

COMPONENT seg14recebido IS
PORT ( 
		entrada : in std_logic_vector (3 downto 0);
		s : out std_logic_vector (6 downto 0);
		s1 : out std_logic_vector (6 downto 0)
		);
end COMPONENT;

COMPONENT seg14corrigido IS
PORT ( 
		entrada : in std_logic_vector (3 downto 0);
		s : out std_logic_vector (6 downto 0);
		s1 : out std_logic_vector (6 downto 0)
		);
end COMPONENT;

COMPONENT seg7posicao IS
PORT ( 
		entrada : in std_logic_vector (2 downto 0);
		s : out std_logic_vector (6 downto 0)
		);
end COMPONENT;

begin 
x1 : soma4 
port map (a=>a, b=>b,s=>sinal1,c4=>overflow);

x2 : hamming
port map (a=>sinal1,s=>sinal2);

x3 : injeta
port map (a=>sinal2,saida=>sinal3,erro=>erro);

x4 : decodham
port map (a=>sinal3,aout=>sinal4,corrigido4=>sinal5,p=>sinal6,erro=>errodecod);

x5: seg14recebido
port map (entrada=>sinal4,s=>s14r1,s1=>s14r2);

x6 : seg14corrigido
port map (entrada=>sinal5,s=>s14c1,s1=>s14c2);

x7 : seg7posicao
port map (entrada=>sinal6,s=>s7p);

end arq_trabalho;
