library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CLA_tb is
end CLA_tb;

architecture Behavioral of CLA_tb is

    -- Signals for testbench
    signal A_tb : std_logic_vector(7 downto 0) := (others => '0');
	signal B_tb : std_logic_vector(7 downto 0) := (others => '0');
    signal Sum_tb : std_logic_vector(8 downto 0);
    

begin

    -- Instantiate the DUT
    DUT: entity work.CLA port map(
        A => A_tb,
        B => B_tb,
        S => Sum_tb
    );
               

    -- Stimulus process: apply inputs
    stimulus:	process
					begin
						-- Test with various input values
						wait for 100 ns;
						for i in -5 to 10 loop
							for j in -4 to 4 loop
								A_tb <= std_logic_vector(to_signed(i, A_tb'length));
								B_tb <= std_logic_vector(to_signed(j+2, B_tb'length));
								wait for 10 ns;  -- Wait for some time for the output to settle
							end loop;
						end loop;
						wait;
				end process stimulus;

end Behavioral;