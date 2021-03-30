module receiver(ce, clk, serial_in, bits_out);

input ce;		//Chip enable
input clk;		// Clock
input serial_in;// serial input = input data

	reg rx_ticks;
	reg[4:0] state;	//register for states
output reg 	[5:0] bits_out; //input 0 is LSB and input 5 is MSB

//set parameters for states
parameter	IDLE 	= 0, 
			LSB 	= 5'b00010,		// 2
			DATA1 	= 5'b00100,		// 4
			DATA2 	= 5'b00110,		// 6
			DATA3 	= 5'b01000,		// 8
			DATA4 	= 5'b01010,		// 10
			DATA5 	= 5'b01100,		// 12
			
			STOP	= 5'b10011;		// 19	


always@(posedge clk) // always at clock rising edge
begin
	if (!ce || !rx_ticks)begin				// start if ce is down or rx_ticks is 0
	case(state)
			IDLE:begin
				if (serial_in)begin			// if start bit is 0 keep on waiting
				state = 5'b11111;
				end else begin
				rx_ticks = 0;				// reset rx_ticks
				end
			end
			LSB:begin						//set LSB data bit
				bits_out [0] = serial_in;
			end
			DATA1:begin						//set 1 data bit
				bits_out [1] = serial_in;
			end
			DATA2:begin						//set 2 data bit
				bits_out [2] = serial_in;
			end
			DATA3:begin						//set 3 data bit
				bits_out [3] = serial_in;
			end
			DATA4:begin						//set 4 data bit
				bits_out [4] = serial_in;
			end
			DATA5:begin						//set 5 data bit
				bits_out [5] = serial_in;
			end
			
			STOP:begin						//set Stop bit to max
				state = 5'b11111;			
				rx_ticks = 1;				// rx_ticks to 1
			end
		endcase
		state = state +1; 	//
	end else begin
	state = 0;				// set state 0 
	end
end

endmodule
