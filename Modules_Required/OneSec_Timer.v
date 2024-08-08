//OneSec_Timer module
//This is where the One_ms_Timer, Count100, Count10 modules are instantiated
module OneSec_Timer(clk, rst, enable, Time_out_1s);

 input clk,rst,enable;
 output Time_out_1s;
 wire Time_out_1ms, Time_out_100ms;

 One_ms_Timer One_ms_Timer1(clk, rst, enable, Time_out_1ms);
 Count100 Count100_1(clk, rst, Time_out_1ms, Time_out_100ms);
 Count10 Count10_1(clk, rst, Time_out_100ms, Time_out_1s);

endmodule 

