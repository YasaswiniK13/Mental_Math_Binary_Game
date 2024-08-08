//Count to 100 module
//This module helps to count 1ms 100 times inturn gives 100ms timeout
module Count100(clk, rst, Time_out_1ms, Time_out_100ms);
  input clk, rst;
  output Time_out_100ms;
  reg Time_out_100ms;
  reg [7:0]count_out100ms;
  input Time_out_1ms;

  always@(posedge clk)
   begin
     if(rst==1'b0)
       begin
         count_out100ms<=0;
         Time_out_100ms<=1'b0;
       end
     else
       begin
         if(Time_out_1ms==1'b1)
           begin
             if(count_out100ms==99)
               begin
               Time_out_100ms<=1'b1;
               count_out100ms<=0; 
               end  
             else
             begin 
             count_out100ms<=count_out100ms+1;
             Time_out_100ms<=1'b0;
             end
         end
        else
        Time_out_100ms<=1'b0;
      end
    end
endmodule

