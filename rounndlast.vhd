LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.aes_pack.ALL;
ENTITY rounndlast IS
	PORT(
		rc 				: IN  std_logic_vector(3   DOWNTO 0);
		rin 			: IN  std_logic_vector(127 DOWNTO 0);
		keylastin : IN  std_logic_vector(127 DOWNTO 0);
		fout 			: OUT std_logic_vector(127 DOWNTO 0)
	);
END rounndlast;
ARCHITECTURE dataflow OF rounndlast IS
	SIGNAL sb 					: std_logic_vector(127 DOWNTO 0);
	SIGNAL sr 					: std_logic_vector(127 DOWNTO 0);
	SIGNAL mcl 					: std_logic_vector(127 DOWNTO 0);
	SIGNAL keyout 			: std_logic_vector(127 DOWNTO 0);
	SIGNAL keyout_temp 	: std_logic_vector(127 DOWNTO 0);
BEGIN 
	t0 : KeyGeneration 	PORT MAP (rc,keylastin,keyout_temp);
	t1 : subbytes 			PORT MAP (rin,sb);
	t2 : shiftrow				PORT MAP (sb,sr);
	fout <= keyout_temp XOR sr;
	keyout <= keyout_temp;
END dataflow;
--akharin round mix nadare
