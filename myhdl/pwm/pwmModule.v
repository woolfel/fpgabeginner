`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:17:02 04/22/2016 
// Design Name: 
// Module Name:    pwmModule 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

entity pwmModule is
    port (
        period: in unsigned(15 downto 0);
        t_on: in unsigned(15 downto 0);
        pwm: out std_logic;
        period_end: out std_logic;
        clk: in std_logic
    );
end entity pwmModule;


architecture MyHDL of pwm_module is





signal count: unsigned(15 downto 0);

begin





PWM_MODULE_LOGIC: process (clk) is
begin
    if rising_edge(clk) then
        if (count = period) then
            count <= to_unsigned(0, 16);
            period_end <= '1';
        else
            count <= (count + 1);
            period_end <= '0';
        end if;
        if (count > t_on) then
            pwm <= '0';
        else
            pwm <= '1';
        end if;
    end if;
end process PWM_MODULE_LOGIC;

end architecture MyHDL;
