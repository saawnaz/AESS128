LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
PACKAGE aes_pack is
	COMPONENT sbox IS
		PORT(
			a 	: IN  std_logic_vector(7 DOWNTO 0);
			c 	: OUT std_logic_vector(7 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT KeyGeneration IS
		PORT(
			rc 			: IN  std_logic_vector(3   DOWNTO 0);
			key 		: IN  std_logic_vector(127 DOWNTO 0);
			keyout 	: OUT std_logic_vector(127 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT subbytes IS
		PORT(
			data 	: IN  std_logic_vector(127 DOWNTO 0);
			sb 		: OUT std_logic_vector(127 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT shiftrow IS
		PORT(
			sb : IN  std_logic_vector(127 DOWNTO 0);
			sr : OUT std_logic_vector(127 DOWNTO 0)
		);
	END COMPONENT;	
	COMPONENT mixcolumn IS
		PORT(
			a 	: IN  std_logic_vector(127 DOWNTO 0);
			mcl : OUT std_logic_vector(127 DOWNTO 0)
		);
	END COMPONENT;
		COMPONENT rounds IS
		PORT(
			rc 			: IN  std_logic_vector(3   DOWNTO 0);
			data 		: IN  std_logic_vector(127 DOWNTO 0);
			keyin 	: IN  std_logic_vector(127 DOWNTO 0);
			keyout 	: OUT std_logic_vector(127 DOWNTO 0);
			rndout 	: OUT std_logic_vector(127 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT rounndlast IS
		PORT(
			rc 				: IN  std_logic_vector(3   DOWNTO 0);
			rin 			: IN  std_logic_vector(127 DOWNTO 0);
			keylastin : IN  std_logic_vector(127 DOWNTO 0);
			fout 			: OUT std_logic_vector(127 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT aesenc IS
		PORT(
			pt 	: IN  std_logic_vector(127 DOWNTO 0);
			kt 	: IN  std_logic_vector(127 DOWNTO 0);
			ct 	: OUT std_logic_vector(127 DOWNTO 0)
		);
	END COMPONENT;

	FUNCTION mcl32(i1, i2, i3, i4 : std_logic_vector(7 DOWNTO 0)) RETURN std_logic_vector;
END PACKAGE;
PACKAGE BODY aes_pack IS
	FUNCTION mcl32(i1, i2, i3, i4 : std_logic_vector(7 DOWNTO 0)) RETURN std_logic_vector IS
		VARIABLE mcl : std_logic_vector(7 DOWNTO 0);
	BEGIN
		mcl(7) := i1(6) XOR i2(6) XOR i2(7) XOR i3(7) XOR i4(7);
		mcl(6) := i1(5) XOR i2(5) XOR i2(6) XOR i3(6) XOR i4(6);
		mcl(5) := i1(4) XOR i2(4) XOR i2(5) XOR i3(5) XOR i4(5);
		mcl(4) := i1(3) XOR i1(7) XOR i2(3) XOR i2(4) XOR i2(7) XOR i3(4) XOR i4(4);
		mcl(3) := i1(2) XOR i1(7) XOR i2(2) XOR i2(3) XOR i2(7) XOR i3(3) XOR i4(3);
		mcl(2) := i1(1) XOR i2(1) XOR i2(2) XOR i3(2) XOR i4(2);
		mcl(1) := i1(0) XOR i1(7) XOR i2(0) XOR i2(1) XOR i2(7) XOR i3(1) XOR i4(1);
		mcl(0) := i1(7) XOR i2(7) XOR i2(0) XOR i3(0) XOR i4(0);
		RETURN mcl;
	END mcl32;
END PACKAGE BODY;
