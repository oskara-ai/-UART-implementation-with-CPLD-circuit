module transmitter(clk, ce, in, ser_out, state);

	input clk;	//clock
	input ce;	//Chip enable
	input [7:0] in;	//inputs 2-9

	output reg ser_out = 1;		//serial out
	output reg[4:0] state = 0; 	
	

	parameter 	start = 5'b00000,	//Start bit
			lsb = 5'b00010,		//Least significant bit
			b1 = 5'b00100,		//Data bit
			b2 = 5'b00110,		//Data bit
			b3 = 5'b01000,		//Data bit
			b4 = 5'b01010,		//Data bit
			b5 = 5'b01100,		//Data bit
			b6 = 5'b01110,		//Data bit
			msb = 5'b10000,		//Most significant bit
			stop = 5'b10010,	//Stop bit
			stop2 = 5'b10011;	//Second stop

	always @(posedge clk)		//always at clocks rising edge
	begin
		if (!ce || (state > 0)) begin		 //read inputs and start continuous transmitting
			case (state)
				start: begin
					ser_out = 0;	 //set serial out to 0
				end
				lsb: begin
					ser_out = in[0]; //set LSB
				end
				b1: begin
					ser_out = in[1]; //set 1 data bit
				end
				b2: begin
					ser_out = in[2]; //set first data bit
				end
				b3: begin
					ser_out = in[3]; //set first data bit
				end
				b4: begin
					ser_out = in[4]; //set first data bit
				end
				b5: begin
					ser_out = in[5]; //set first data bit
				end
				b6: begin
					ser_out = in[6]; //set first data bit
				end
				msb: begin
					ser_out = in[7]; //set first data bit
				end
				stop: begin
					ser_out = 1; 	 //set serial out to 1
				end
				stop2: begin 
					ser_out = 1;
					state = 5'b11111; //set state to max
				end

			endcase
			state = state + 1;	//increase state
		end
		else begin 
			ser_out = 1;
			state = 0;		//state to 0
		end
	end
endmodule

