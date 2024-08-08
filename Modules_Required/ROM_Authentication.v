//ROM_Authentication Module
//This module is where the player entered password is checked with the password stored in the ROM
module ROM_Authentication(Password_Enter, Password, Logged_In, Logged_Out, clk, rst, Passed, q_ROM, ROM_addr);	
 input Password_Enter;
 input [3:0]Password;
 output Passed;
 input [3:0]q_ROM;
 reg [3:0]ROM_Data; 
 output [4:0]ROM_addr;
 output Logged_In, Logged_Out;
 input clk, rst;
 reg Logged_In, Logged_Out;
 reg Passed;
 reg [1:0]Cnt; reg [4:0]ROM_addr;
 
 parameter Check_Button=0, Fetching_ROM_WD=1, ROM_Cycle1=2, ROM_Cycle2=3, ROM_Catch=4, Compare=5, 
 Cnt_CMP=6, Verify=7, Success=8;
 reg [3:0]State;
 reg SFSG;
 reg [3:0]Password_AC;

 always@(posedge clk)begin
  if(rst==1'b0)begin
      SFSG<=1'b1;
      Logged_In<=1'b0; Logged_Out<=1'b1; Passed<=1'b0; Cnt<=2'b00;
      State<=Check_Button; ROM_addr<=5'b00000;
     end
   else
     begin
        case(State)
            Check_Button:begin
               Logged_In<=1'b0; Logged_Out<=1'b1; Passed<=1'b0;
               if(Password_Enter==1'b1)begin
                   State<=Fetching_ROM_WD;
               end
               else begin
                   State<=Check_Button;
               end
            end
             
            Fetching_ROM_WD:begin
		Password_AC<=Password;
               ROM_addr<={3'b000, Cnt};
               State<=ROM_Cycle1;
            end
    
            ROM_Cycle1:begin
               State<=ROM_Cycle2;
            end

            ROM_Cycle2:begin
               State<=ROM_Catch;
            end
 
            ROM_Catch:begin
                ROM_Data<=q_ROM;
                State<=Compare;
            end
   
            Compare:begin
                if(Password_AC!=ROM_Data)begin
                         SFSG<=1'b0;
                       State<=Cnt_CMP;
                end
                else begin
                       SFSG<=1'b1;
                       State<=Cnt_CMP;
                end
            end

            Cnt_CMP:begin
                if(Cnt==2'b11)begin
                   State<=Verify;
                   
                end
                else begin
                  Cnt<=Cnt+1;
                   State<=Check_Button;
                end
            end

            Verify:begin
               if(SFSG==1'b1)begin       
                  State<=Success;
                 end
               else
                 begin
                  State<=Check_Button;
                 end
            end
				
            Success:begin
                   Passed<=1'b1;
						Logged_In<=1'b1; Logged_Out<=1'b0;
             end
            
           default:begin
              SFSG<=1'b1;
              Logged_In<=1'b0; Logged_Out<=1'b1; Passed<=1'b0;
              State<=Check_Button;
           end
          endcase
        end
      end
endmodule 

               
          


