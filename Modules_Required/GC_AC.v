//GC_AC module
//This is the module in ehic Game_Controller module, ROM_PSWD and ROM_Authentication modules are instantiated
module GC_AC(Password_Enter, Password, Logged_In, Logged_Out, clk, rst, Load_P1_In, RNG_Gen_In, Load_P1_Out, RNG_Gen_Out, Timer_reconfig, Timer_enable, DigitTime_Out);

  input [3:0]Password;
  input clk, rst;
  input Load_P1_In, RNG_Gen_In;
  output Logged_In, Logged_Out;
  output Load_P1_Out, RNG_Gen_Out;
  wire Passed; wire Password_Enter;
  input DigitTime_Out; output Timer_enable; output Timer_reconfig;
  input Password_Enter;
  wire [4:0]addr;
  wire [3:0]q_ROM;
 
  ROM_PSWD ROM_PSWD1(addr, clk, q_ROM);
  ROM_Authentication ROM_Authentication1(Password_Enter, Password, Logged_In, Logged_Out, clk, rst, Passed, q_ROM, addr);
  Game_Controller Game_Controller1(Password_Enter, Passed, Load_P1_In, RNG_Gen_In, Load_P1_Out, RNG_Gen_Out, clk, rst, 
                                   Timer_enable, Timer_reconfig, DigitTime_Out);

endmodule
