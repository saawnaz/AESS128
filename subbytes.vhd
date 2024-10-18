LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.aes_pack.ALL;
ENTITY subbytes IS
	PORT(
		data 	: IN  std_logic_vector(127 DOWNTO 0);
		sb 		: OUT std_logic_vector(127 DOWNTO 0)
	);
END subbytes;
ARCHITECTURE structural OF subbytes IS
BEGIN
	q0  : sbox PORT MAP (a => data(127 DOWNTO 120), c => sb(127 DOWNTO 120) );
	q1  : sbox PORT MAP (a => data(119 DOWNTO 112), c => sb(119 DOWNTO 112) );
	q2  : sbox PORT MAP (a => data(111 DOWNTO 104), c => sb(111 DOWNTO 104) );
	q3  : sbox PORT MAP (a => data(103 DOWNTO 96) , c => sb(103 DOWNTO 96) );
	q4  : sbox PORT MAP (a => data(95 DOWNTO 88)	 , c => sb(95 DOWNTO 88) );
	q5  : sbox PORT MAP (a => data(87 DOWNTO 80)	 , c => sb(87 DOWNTO 80) );
	q6  : sbox PORT MAP (a => data(79 DOWNTO 72)	 , c => sb(79 DOWNTO 72) );
	q7  : sbox PORT MAP (a => data(71 DOWNTO 64)	 , c => sb(71 DOWNTO 64) );
	q8  : sbox PORT MAP (a => data(63 DOWNTO 56)	 , c => sb(63 DOWNTO 56) );
	q9  : sbox PORT MAP (a => data(55 DOWNTO 48)	 , c => sb(55 DOWNTO 48) );
	q10 : sbox PORT MAP (a => data(47 DOWNTO 40)	 , c => sb(47 DOWNTO 40) );
	q11 : sbox PORT MAP (a => data(39 DOWNTO 32)	 , c => sb(39 DOWNTO 32) );
	q12 : sbox PORT MAP (a => data(31 DOWNTO 24)	 , c => sb(31 DOWNTO 24) );
	q13 : sbox PORT MAP (a => data(23 DOWNTO 16)	 , c => sb(23 DOWNTO 16) );
	q14 : sbox PORT MAP (a => data(15 DOWNTO 8) 	 , c => sb(15 DOWNTO 8) );
	q15 : sbox PORT MAP (a => data(7 DOWNTO 0)  	 , c => sb(7 DOWNTO 0) );
END structural;
--subbyte 8ta sbox dare
--16 byte mide sbox khoroojisho migire
--sbox yek tabe sabete(sbox.vhd)
