LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.aes_pack.ALL;
ENTITY aesenc_tb IS END aesenc_tb;
ARCHITECTURE dataflow OF aesenc_tb IS
	SIGNAL pt_tb 	: std_logic_vector(127 DOWNTO 0);
	SIGNAL kt_tb 	: std_logic_vector(127 DOWNTO 0);
	SIGNAL ct_tb 	: std_logic_vector(127 DOWNTO 0);
BEGIN
	aes : aesenc 	PORT MAP (pt => pt_tb, kt  => kt_tb, ct => ct_tb);    
	PROCESS
	BEGIN
		kt_tb <= X"10a58869d74be5a374cf867cfb473859";
		pt_tb <= X"00000000000000000000000000000000";
		-- ct = 6d251e6944b051e04eaa6fb4dbf78465
		WAIT FOR 100 ns;
		kt_tb <= X"caea65cdbb75e9169ecd22ebe6e54675";
		pt_tb <= X"00000000000000000000000000000000";
		-- ct = 6e29201190152df4ee058139def610bb
		WAIT FOR 100 ns;
		kt_tb <= X"b6364ac4e1de1e285eaf144a2415f7a0";
		pt_tb <= X"00000000000000000000000000000000";
		-- ct = 5d9b05578fc944b3cf1ccf0e746cd581
		WAIT FOR 100 ns;
		kt_tb <= X"64cf9c7abc50b888af65f49d521944b2";
		pt_tb <= X"00000000000000000000000000000000";
		-- ct = f7efc89d5dba578104016ce5ad659c05
		WAIT;
		
	END PROCESS;
ENd dataflow;
