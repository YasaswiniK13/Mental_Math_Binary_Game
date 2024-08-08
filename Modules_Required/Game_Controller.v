//Game_Controller
//This module controls the game flow(player entered digit display, random number generation, timer display) 
module Game_Controller(Password_Enter, Passed, Load_P1_In, RNG_Gen_In, Load_P1_Out, RNG_Gen_Out, clk, rst, 
                       Timer_enable, Timer_reconfig, DigitTime_Out);	
 input Password_Enter, Passed, Load_P1_In, RNG_Gen_In;
 input DigitTime_Out;
 output Load_P1_Out, RNG_Gen_Out;
 output Timer_enable, Timer_reconfig;
 input clk, rst;
 reg Load_P1_Out, RNG_Gen_Out;
 reg Timer_enable, Timer_reconfig;
 
 parameter Initial=1, Reconfig_Timer=2, Wait_For_Game_Start=3, Game_Play=4, Game_Over=5;
 reg [3:0]State;

 always@(posedge clk)begin
  if(rst==1'b0)begin
      Load_P1_Out<=1'b0; RNG_Gen_Out<=1'b1; Timer_enable<=1'b0; Timer_reconfig<=1'b0;
      State<=Initial; 
     end
   else
     begin
        case(State)
          Initial:begin
              Load_P1_Out<=1'b0; RNG_Gen_Out<=1'b1; Timer_enable<=1'b0; Timer_reconfig<=1'b0;
               if(Passed==1'b1)begin
                  State<=Reconfig_Timer;
                  end
               else
                  begin
                  State<=Initial;
                  end
          end
             
          Reconfig_Timer:begin
             Timer_reconfig<=1'b1;
	          State<=Wait_For_Game_Start;	
          end
				
	       Wait_For_Game_Start:begin
             Timer_reconfig<=1'b0;
	          if(Password_Enter==1'b1)begin
		            Timer_enable<=1'b1;
	               State<=Game_Play;
	          end
	          else begin
                State<=Wait_For_Game_Start;
	          end
	      end
			
         Game_Play:begin
	          Load_P1_Out<=Load_P1_In; RNG_Gen_Out<=RNG_Gen_In;
	          if(DigitTime_Out==1'b1)begin
						State<=Game_Over;
				 end
	          else begin
		          State<=Game_Play;
		       end
	     end
				
        Game_Over:begin
	          Timer_enable<=1'b0; Load_P1_Out<=1'b0; RNG_Gen_Out<=1'b1;
	          if(Password_Enter==1'b1)begin
		          State<=Reconfig_Timer;
		       end
	          else begin
		          State<=Game_Over;
		       end
	    end  
		       
       default:begin
              Load_P1_Out<=1'b0; RNG_Gen_Out<=1'b1; Timer_enable<=1'b0; Timer_reconfig<=1'b0;
              State<=Initial;
       end
     endcase
   end
 end
endmodule 

               
          

