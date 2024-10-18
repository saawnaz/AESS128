LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.aes_pack.ALL;
ENTITY KeyGeneration IS
	PORT(
		rc 			: IN  std_logic_vector(3   DOWNTO 0);
		key 		: IN  std_logic_vector(127 DOWNTO 0);
		keyout 	: OUT std_logic_vector(127 DOWNTO 0)
	);
END KeyGeneration;
ARCHITECTURE dataflow OF KeyGeneration IS
 SIGNAL w0, w1, w2, w3, tem : std_logic_vector(31 DOWNTO 0);
	FUNCTION rcon(rcx : IN std_logic_vector(3 DOWNTO 0)) RETURN std_logic_vector IS
	BEGIN
		CASE rcx IS
			WHEN X"0" 	=>  RETURN X"01000000";
			WHEN X"1" 	=>  RETURN X"02000000";
			WHEN X"2" 	=>  RETURN X"04000000";
			WHEN X"3" 	=>  RETURN X"08000000";
			WHEN X"4" 	=>  RETURN X"10000000";
			WHEN X"5" 	=>  RETURN X"20000000";
			WHEN X"6" 	=>  RETURN X"40000000";
			WHEN X"7" 	=>  RETURN X"80000000";
			WHEN X"8" 	=>  RETURN X"1b000000";
			WHEN X"9" 	=>  RETURN X"36000000";
			WHEN OTHERS => 	RETURN X"00000000";
		END CASE;
	END rcon;
	COMPONENT sbox IS
		PORT(
			a 	: IN  std_logic_vector(7 DOWNTO 0);
			c 	: OUT std_logic_vector(7 DOWNTO 0)
		);
	END COMPONENT;	
BEGIN   
	w0 <= key(127 DOWNTO 96);
	w1 <= key(95  DOWNTO 64);
	w2 <= key(63  DOWNTO 32);
	w3 <= key(31  DOWNTO 0);

	keyout(127 DOWNTO 96) <= w0 XOR tem XOR rcon(rc);
	keyout(95  DOWNTO 64) <= w0 XOR tem XOR rcon(rc)XOR w1;
	keyout(63  DOWNTO 32) <= w0 XOR tem XOR rcon(rc)XOR w1 XOR w2;
	keyout(31  DOWNTO 0)  <= w0 XOR tem XOR rcon(rc)XOR w1 XOR w2 XOR w3;

	a1 : sbox PORT MAP (a => w3(23 DOWNTO 16), c => tem(31 DOWNTO 24));
	a2 : sbox PORT MAP (a => w3(15 DOWNTO 8),  c => tem(23 DOWNTO 16));
	a3 : sbox PORT MAP (a => w3(7 DOWNTO 0),   c => tem(15 DOWNTO 8));
	a4 : sbox PORT MAP (a => w3(31 DOWNTO 24), c => tem(7 DOWNTO 0));
END dataflow;
--rcon = round condishon