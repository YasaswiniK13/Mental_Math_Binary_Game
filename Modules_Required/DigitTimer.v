//DigitTimer module
//This is the module in which 1's digit and 10's digit of the timer are instantiated
module DigitTimer(clk, rst, enable, reconfig, DigitTime_out, DigitCount1, DigitCount2);

  input clk, rst, enable, reconfig;
  output DigitTime_out;
  output [3:0]DigitCount1;
  output [3:0]DigitCount2;
  wire Time_out_1s, BUPDn1, NBDNUp2, BUP2;

  Digit Digit1(clk, rst, reconfig, Time_out_1s, NBDNUp2, BUPDn1, DigitTime_out, DigitCount1);
  Digit Digit2(clk, rst, reconfig, BUPDn1, 1'b1, BUP2, NBDNUp2, DigitCount2);
  OneSec_Timer OneSec_Timer1(clk, rst, enable, Time_out_1s);

endmodule

