LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;

ENTITY exemplo13_meio_somador IS
  PORT(
  a, b: in std_logic;
  s, c_out: out std_logic
  );
end exemplo13_meio_somador;
architecture arq_exemplo13_meio_somador of exemplo13_meio_somador is
begin 
  s <= (not(a) and b) or (a and not(b));
  c_out <= a and b;
end arq_exemplo13_meio_somador;