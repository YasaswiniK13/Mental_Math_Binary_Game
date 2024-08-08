//LoadRegister module
//This is the module which helps to display the user entered numbers all at once on the 7-Segment display. 

module LoadRegister(D_in, D_out, clk, rst, load);
    input [3:0]D_in;
    output [3:0]D_out;
    input clk, rst, load;
    reg [3:0]D_out;

    always@(posedge clk)
        begin
            if(rst==1'b0) 
               begin
                  D_out<=4'b0000;
               end
            else
               begin
                   if(load==1'b1)
                      begin
                         D_out<=D_in;
                      end
               end
        end
endmodule 