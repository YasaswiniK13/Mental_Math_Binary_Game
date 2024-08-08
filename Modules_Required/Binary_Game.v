//This is the module where all the modules needed for the lab are instantiated
module Binary_Game(Player1, Player1_Out, RNG_Gen_In, RNG_Out, Password, FinalDisplay, Matched_LED, Unmatched_LED, Logged_In, 
                             Logged_Out, BP1_in, BAC_in, clk, rst, Digit1, Digit2);
   input [3:0]Player1;
   input [3:0]Password;
	input clk, rst;
   input RNG_Gen_In;
	input BP1_in, BAC_in;
	output [6:0]Digit1; output [6:0]Digit2;
   output [6:0]Player1_Out;output [6:0]RNG_Out; output [6:0]FinalDisplay;
	output Matched_LED, Unmatched_LED;
	output Logged_In, Logged_Out;
	wire [3:0]decoder_in;
	wire [3:0]D_out1; wire [3:0]D_out2;
	wire Load_P1_In;
	wire Load_P1_Out; wire RNG_Gen_Out;
	wire Password_Enter;
	wire DigitTime_Out; wire Timer_enable; wire Timer_reconfig;
	wire [3:0]DigitCount1; wire [3:0]DigitCount2;

   Decoder_7Seg Decoder_7Seg1(D_out1, Player1_Out);
   Decoder_7Seg Decoder_7Seg2(D_out2, RNG_Out);
   Adder_4bit Adder_4bit_Sum(D_out1, D_out2, decoder_in);
   Decoder_7Seg Decoder_7Seg3(decoder_in, FinalDisplay);
	Verification Verification_sum(decoder_in, Matched_LED, Unmatched_LED);
	LoadRegister LoadRegister_P1(Player1, D_out1, clk, rst, Load_P1_Out);
   RNG_Gen RNG_Gen2(clk, rst, RNG_Gen_Out, D_out2);
	ButtonShaper ButtonShaper_P1(BP1_in, Load_P1_In, clk, rst);
	ButtonShaper ButtonShaper_AC(BAC_in, Password_Enter, clk, rst);
	GC_AC GC_AC1(Password_Enter, Password, Logged_In, Logged_Out, clk, rst, Load_P1_In, RNG_Gen_In, Load_P1_Out, RNG_Gen_Out, Timer_reconfig, 
	             Timer_enable, DigitTime_Out);          
	DigitTimer DigitTimer1(clk, rst, Timer_enable, Timer_reconfig, DigitTime_Out, DigitCount1, DigitCount2);
	Decoder_7Seg Decoder_7Seg4(DigitCount1, Digit1);
	Decoder_7Seg Decoder_7Seg5(DigitCount2, Digit2);
   
endmodule


