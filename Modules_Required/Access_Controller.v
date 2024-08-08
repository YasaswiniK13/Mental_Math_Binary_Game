//This is where all the modules related to access are instantiated
module Access_Controller(Password_Enter, Password, Logged_In, Logged_Out, clk, rst, Passed);	
 input Password_Enter;
 input [3:0]Password;
 output Passed;
 output Logged_In, Logged_Out;
 input clk, rst;
 wire [4:0]addr;
 wire [3:0]q_ROM;
 
 ROM_PSWD ROM_PSWD1(addr, clk, q_ROM);
 ROM_Authentication ROM_Authentication1(Password_Enter, Password, Logged_In, Logged_Out, clk, rst, Passed, q_ROM, addr);
 
endmodule


 

 
               
          

