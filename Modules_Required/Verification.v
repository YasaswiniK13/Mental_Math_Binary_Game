//Verification module
//This is the module where sum is compared with 1111
module Verification(Sum, Left_LED, Right_LED);
   input [3:0]Sum;
   output Left_LED=0;
   output Right_LED=0;
   reg Left_LED;
	reg Right_LED;

   always @ (Sum)
     begin
       if (Sum==4'b1111)
        begin
         Left_LED=1;
			Right_LED=0;
        end
       else
        begin
         Right_LED=1;
			Left_LED=0;
        end
     end
endmodule

