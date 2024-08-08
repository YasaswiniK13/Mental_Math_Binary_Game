//Digit module
//This module helps to decrement a digit from 9 to 0
module Digit(clk, rst, reconfig, BDN, NBUP, BUP, NBDN, DigitCount);

 input clk, rst, reconfig;
 input BDN, NBUP;
 output [3:0]DigitCount;
 output BUP, NBDN;
 reg [3:0]DigitCount;
 reg BUP, NBDN;

 always@(posedge clk)
   begin
       if(rst==1'b0)
          begin
            DigitCount<=4'b0000;
            BUP<=1'b0;
            NBDN<=1'b0;
          end
       else
          begin
			    BUP<=1'b0;
             if(reconfig==1'b1)
                begin
                  DigitCount<=4'b1001;
						NBDN<=1'b0;
						BUP<=1'b0;
                end
             else
                begin
                   BUP<=1'b0;
                   if(BDN==1'b1)
                      begin
                         if(DigitCount==4'b0000)
                            begin
                              if(NBUP==1'b1)
                                 begin
                                   NBDN<=1'b1;
                                 end
                              else
                                 begin
                                   DigitCount<=4'b1001;
                                   BUP<=1'b1;
                                 end
                            end
                       else if(DigitCount==4'b0001)
                          begin
                            if(NBUP==1'b1)
                                 begin
                                   NBDN<=1'b1;
                                 end
                            DigitCount<=DigitCount-1;
                           end
                         else
                            begin
                              DigitCount<=DigitCount-1;
                              NBDN<=1'b0;
                            end
                      end
                  else
                      begin
                        DigitCount<=DigitCount;
                      end
               end
         end
    end
endmodule    

