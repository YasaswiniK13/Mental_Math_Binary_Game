//Counter(LFSR)
//This module is the internal module for RNG_Gen module, helps in counting
module Counter(clk, rst, count, LFSR);
  input count;
  input clk, rst;
  output [3:0] LFSR;
  reg [3:0] LFSR;
  wire feedback = LFSR[3];


  always @(posedge clk)
    begin
      if(rst==1'b0)
        begin
          LFSR<=4'b0000;
        end
      else
        begin
          if(count==1'b1)
            begin
                LFSR[0] <= feedback;
                LFSR[1] <= LFSR[0] ~^ feedback;
                LFSR[2] <= LFSR[1];
                LFSR[3] <= LFSR[2];
            end
        end
    end
endmodule





