LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.aes_pack.ALL;
ENTITY rounds IS
	PORT(
		rc 		: IN  std_logic_vector(3   DOWNTO 0);
		data 		: IN  std_logic_vector(127 DOWNTO 0);
		keyin 	: IN  std_logic_vector(127 DOWNTO 0);
		keyout 	: OUT std_logic_vector(127 DOWNTO 0);
		rndout 	: OUT std_logic_vector(127 DOWNTO 0)
	);
END rounds;
ARCHITECTURE dataflow OF rounds IS
	SIGNAL sb  					: std_logic_vector(127 DOWNTO 0);
	SIGNAL sr  					: std_logic_vector(127 DOWNTO 0);
	SIGNAL mcl 					: std_logic_vector(127 DOWNTO 0);
	SIGNAL keyout_temp 	: std_logic_vector(127 DOWNTO 0);
BEGIN
	t0 : KeyGeneration 	PORT MAP (rc, keyin, keyout_temp);
	t1 : subbytes 			PORT MAP (data, sb);
	t2 : shiftrow				PORT MAP (sb, sr);
	t3 : mixcolumn 			PORT MAP (sr, mcl);
	rndout <= keyout_temp XOR mcl;
	keyout <= keyout_temp;
END dataflow;
-- har round aval kelid ro misaze 
-- bad sub shift mix addround