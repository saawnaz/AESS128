LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.aes_pack.ALL;
ENTITY aesenc IS
	PORT(
		pt 	: IN  std_logic_vector(127 DOWNTO 0);
		kt 	: IN  std_logic_vector(127 DOWNTO 0);
		ct 	: OUT std_logic_vector(127 DOWNTO 0)
	);
END aesenc;
ARCHITECTURE dataflow OF aesenc IS
	SIGNAL r0_out 	: std_logic_vector(127 DOWNTO 0);
	SIGNAL r1_out 	: std_logic_vector(127 DOWNTO 0);
	SIGNAL r2_out 	: std_logic_vector(127 DOWNTO 0);
	SIGNAL r3_out 	: std_logic_vector(127 DOWNTO 0);
	SIGNAL r4_out 	: std_logic_vector(127 DOWNTO 0);
	SIGNAL r5_out	: std_logic_vector(127 DOWNTO 0);
	SIGNAL r6_out 	: std_logic_vector(127 DOWNTO 0);
	SIGNAL r7_out 	: std_logic_vector(127 DOWNTO 0);
	SIGNAL r8_out 	: std_logic_vector(127 DOWNTO 0);
	SIGNAL r9_out 	: std_logic_vector(127 DOWNTO 0);
	SIGNAL keyout1 	: std_logic_vector(127 DOWNTO 0);
	SIGNAL keyout2 	: std_logic_vector(127 DOWNTO 0);
	SIGNAL keyout3 	: std_logic_vector(127 DOWNTO 0);
	SIGNAL keyout4 	: std_logic_vector(127 DOWNTO 0);
	SIGNAL keyout5 	: std_logic_vector(127 DOWNTO 0);
	SIGNAL keyout6 	: std_logic_vector(127 DOWNTO 0);
	SIGNAL keyout7 	: std_logic_vector(127 DOWNTO 0);
	SIGNAL keyout8 	: std_logic_vector(127 DOWNTO 0);
	SIGNAL keyout9 	: std_logic_vector(127 DOWNTO 0);
BEGIN
	r0_out <= pt XOR kt; --add roundkey aval
	r1 	: rounds 			PORT MAP (rc => "0000", data => r0_out, keyin     => kt    , keyout => keyout1, rndout => r1_out);
	r2 	: rounds 			PORT MAP (rc => "0001", data => r1_out, keyin     => keyout1, keyout => keyout2, rndout => r2_out);
	r3 	: rounds 			PORT MAP (rc => "0010", data => r2_out, keyin     => keyout2, keyout => keyout3, rndout => r3_out);
	r4 	: rounds 			PORT MAP (rc => "0011", data => r3_out, keyin     => keyout3, keyout => keyout4, rndout => r4_out);
	r5 	: rounds 			PORT MAP (rc => "0100", data => r4_out, keyin     => keyout4, keyout => keyout5, rndout => r5_out);
	r6 	: rounds 			PORT MAP (rc => "0101", data => r5_out, keyin     => keyout5, keyout => keyout6, rndout => r6_out);
	r7 	: rounds 			PORT MAP (rc => "0110", data => r6_out, keyin     => keyout6, keyout => keyout7, rndout => r7_out);
	r8 	: rounds 			PORT MAP (rc => "0111", data => r7_out, keyin     => keyout7, keyout => keyout8, rndout => r8_out);
	r9 	: rounds 			PORT MAP (rc => "1000", data => r8_out, keyin     => keyout8, keyout => keyout9, rndout => r9_out);
	r10 : rounndlast 	PORT MAP (rc => "1001", rin  => r9_out, keylastin => keyout9, fout   => ct);     --lastround mix nadare
ENd dataflow;
