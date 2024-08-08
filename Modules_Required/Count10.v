//Count to 10 module
//This module helps to count 100ms 10 times which in turn gives 1sec as output 
module Count10(clk, rst, Time_out_100ms, Time_out_1s);
  input clk, rst;
  output Time_out_1s;
  reg Time_out_1s;
  reg [3:0]count_out1s;
  input Time_out_100ms;
  
  always@(posedge clk)
   begin
     if(rst==1'b0)
       begin
         count_out1s<=0;
         Time_out_1s<=1'b0;
       end
     else
       begin
         if(Time_out_100ms==1'b1)
           begin
             if(count_out1s==9)
               begin
               Time_out_1s<=1'b1;
               count_out1s<=0;
               end
             else
               begin  
               count_out1s<=count_out1s+1;
               Time_out_1s<=0;
               end
            end
           else
           Time_out_1s<=1'b0;
        end
   end
endmodule 

