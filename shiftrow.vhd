LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.aes_pack.ALL;
ENTITY shiftrow IS
	PORT(
		sb : IN  std_logic_vector(127 DOWNTO 0);
		sr : OUT std_logic_vector(127 DOWNTO 0)
	);
END shiftrow;
ARCHITECTURE dataflow OF shiftrow IS
BEGIN 
	sr(127 DOWNTO 120) 	<= sb(127 DOWNTO 120);  
	sr(119 DOWNTO 112) 	<= sb(87  DOWNTO 80);
	sr(111 DOWNTO 104) 	<= sb(47  DOWNTO 40);
	sr(103 DOWNTO 96)  	<= sb(7   DOWNTO 0);
	sr(95  DOWNTO 88) 	<= sb(95  DOWNTO 88);
	sr(87  DOWNTO 80) 	<= sb(55  DOWNTO 48);
	sr(79  DOWNTO 72) 	<= sb(15  DOWNTO 8);
	sr(71  DOWNTO 64) 	<= sb(103 DOWNTO 96);
	sr(63  DOWNTO 56) 	<= sb(63  DOWNTO 56);
	sr(55  DOWNTO 48) 	<= sb(23  DOWNTO 16);
	sr(47  DOWNTO 40) 	<= sb(111 DOWNTO 104);
	sr(39  DOWNTO 32) 	<= sb(71  DOWNTO 64);
	sr(31  DOWNTO 24) 	<= sb(31  DOWNTO 24);
	sr(23  DOWNTO 16) 	<= sb(119 DOWNTO 112);
	sr(15  DOWNTO 8) 		<= sb(79  DOWNTO 72);
	sr(7   DOWNTO 0) 		<= sb(39  DOWNTO 32); 
END dataflow;
--shift sade
--avali shift nadare
--dovomi 1 shift left
--sevomi 1 shift left
--dovomi 2shift left