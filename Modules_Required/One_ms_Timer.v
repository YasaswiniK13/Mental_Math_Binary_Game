//One_ms_Timer module
//This is where 1ms time is generated using the LFSR counter logic
module One_ms_Timer(clk, rst, enable, Time_out_1ms);
  input clk, rst;
  input enable;
  output Time_out_1ms;
  reg Time_out_1ms;
  reg [15:0] LFSR;
  wire feedback = LFSR[15];

  always @(posedge clk)
  begin
     if(rst==1'b0)
       begin
         LFSR<=16'b0000000000000000;
         Time_out_1ms<=1'b0;
       end
     else
       begin
         Time_out_1ms<=1'b0;
         if(enable==1'b1)
           begin  
            if(LFSR==16'b1001001001001001)
              begin
               Time_out_1ms<=1'b1;
               LFSR<=16'b0000000000000000;
              end
           else
              begin
               LFSR[0] <= feedback;
               LFSR[1] <= LFSR[0];
               LFSR[2] <= LFSR[1] ~^ feedback;
               LFSR[3] <= LFSR[2] ~^ feedback;
               LFSR[4] <= LFSR[3];
               LFSR[5] <= LFSR[4] ~^ feedback;
               LFSR[6] <= LFSR[5];
               LFSR[7] <= LFSR[6];
               LFSR[8] <= LFSR[7];
               LFSR[9] <= LFSR[8];
               LFSR[10] <= LFSR[9];
               LFSR[11] <= LFSR[10];
               LFSR[12] <= LFSR[11];
               LFSR[13] <= LFSR[12];
               LFSR[14] <= LFSR[13];
               LFSR[15] <= LFSR[14];
              Time_out_1ms<=1'b0;
              end
          end
        else
          begin
          Time_out_1ms<=1'b0;
          end
       end
    end
endmodule




