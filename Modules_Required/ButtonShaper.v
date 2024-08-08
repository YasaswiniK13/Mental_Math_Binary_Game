//ButtonShaper module
//This is the module which helps to display, check(in case of password) the user entered numbers only after pressing the disignated button. 
module ButtonShaper(B_in, B_out, clk, rst);

    input B_in;
    output B_out;
    input clk, rst;
    reg B_out;
    parameter INIT=0, PULSE=1, WAIT=2;
    reg [1:0]State, StateNext;

    always@(State, B_in)
    begin
      case(State)
         INIT:begin
           B_out=1'b0;
           if(B_in==1'b1)
             StateNext=INIT;
           else
             StateNext=PULSE;
           end
         PULSE:begin
           B_out=1'b1;
           StateNext=WAIT;
           end
         WAIT:begin
           B_out=1'b0;
           if(B_in==1'b0)
             StateNext=WAIT;
           else
             StateNext=INIT;
           end
         default:begin
           B_out=1'b0;
           StateNext=INIT;
           end
      endcase
    end
	 
   always@(posedge clk)begin
       if(rst==1'b0)
           State<=INIT;
       else
           State<=StateNext;
     end
endmodule

