library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shift_8 is
    port (
        clock, RIN, LIN, reset : in std_logic;
        parallel_in : in std_logic_vector(7 downto 0);
        control : in std_logic_vector(2 downto 0);
        Q : out std_logic_vector(7 downto 0);
    );
end entity shift_8;

architecture behaviour of shift_8 is
    signal Regs : std_logic_vector(7 downto 0);
    begin

    process(regs, clock, reset)
    begin
    if reset = '1' then Regs <= "00000000";

    else rising_edge(clock) then

       case( control ) is
       
           when "000" => Regs <= Regs; -- hold
           when "001" => Regs <= parallel_in; -- load parallel
           when "010" => Regs <= RIN & Regs(7 downto 1); -- shift right, LSB is discarded
           when "011" => Regs <= Regs(6 downto 0) & LIN; -- shift left
           when "100" => Regs <= Regs(0) & Regs(7 downto 1); -- rotate right (lowest bit becomes new highest bit)
           when "101" => Regs <= Regs(6 downto 0) & Regs(7); -- rotate left
           when "110" => Regs <= Regs(7) & Regs(7 downto 1); -- arithmetic shift right (binary number retains its sign)
           when "111" => Regs <= Regs(7 downto 1) & '0'; -- arithmetic shift right

           when others => Regs <= Regs;
       
       end case ;

       end if;
       Q <= regs; -- output
   end process;

end behaviour;
