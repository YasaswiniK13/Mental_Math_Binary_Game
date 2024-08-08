//RNG_Gen module
//In this module Random number is generated using counter logic
module RNG_Gen(clk, rst, RNG_Gen, Random_Number);
 
 input clk, rst;
 input RNG_Gen;
 output [3:0]Random_Number;
 wire count;
  
 Counter Counter1(clk, rst, count, Random_Number);
 
 assign count=~RNG_Gen;

endmodule
