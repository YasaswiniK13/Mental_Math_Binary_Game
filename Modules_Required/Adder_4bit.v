//Adder_4bit
//This is the module where player1 and player2 entered numbers added

module Adder_4bit(Player1, Player2, Sum);
   input [3:0]Player1;
   input [3:0]Player2;
   output [3:0]Sum;
   reg [3:0]Sum;

   always @ (Player1, Player2)
     begin
       	Sum = Player1+Player2;
     end
endmodule

