//-----------------------------
//-- Plexers
//-----------------------------

module dmx1bit(output s0, output s1,input a,input key);
	reg s0,s1;
	
	initial begin
		s0 = 0;
		s1 = 0;
	end
	always @(key or s0 or s1 or a)
		begin
			if(~key)
				begin
					s0 = a;
					s1 = 0;
				end
			else
				begin
					s0 = 0;
					s1 = a;
				end
		end
endmodule //-- dmx1

//--************************

module dmx2bits(output [3:0]s, input x, input [1:0]key);
	reg [3:0]s;
	initial begin
		s = 0;
	end
	
	always @ (key or posedge x or s)
	begin
		if(key == 0)
			s = 4'b0001;
		else if(key == 1)
			s = 4'b0010;
		else if(key == 2)
			s = 4'b0100;
		else if(key == 3)
			s = 4'b1000;
	end
	
	always @(negedge x)
	begin
		s = 0;
	end
endmodule //-- dmx2bits

//--************************

module dmx3bits(output [7:0]s, input x, input [2:0]key);
	
	reg [7:0]s;
	
	initial begin
		s = 0;
	end
	
	always @ (key or posedge x or s)
	begin
		if(key == 0)
			s = 8'b00000001;
		else if(key == 1)
			s = 8'b00000010;
		else if(key == 2)
			s = 8'b00000100;
		else if(key == 3)
			s = 8'b00001000;
		else if(key == 4)
			s = 8'b00010000;
		else if(key == 5)
			s = 8'b00100000;
		else if(key == 6)
			s = 8'b01000000;
		else if(key == 7)
			s = 8'b10000000;
	end
	
	always @(negedge x)
	begin
		s = 0;
	end
endmodule //--dmx3bits

//--************************

module mux1bit(output [3:0]s, input [3:0]i0,input [3:0]i1, input key);
	
	reg [3:0]s;
	
	always @(key or i1 or i0)
	begin
		if(~key)
		begin
			s = i0;
		end
		else
		begin
			s = i1;
		end
	end
endmodule //--mux1

//--************************

module mux1bit2(output [7:0]s, input [7:0]i0,input [7:0]i1, input key);
	
	reg [7:0]s;
	
	always @(key or i1 or i0)
	begin
		if(~key)
		begin
			s = i0;
		end
		else
		begin
			s = i1;
		end
	end
endmodule //-- mux1

//--************************

module mux2bits(output[7:0]s, input[7:0]i0, input[7:0]i1,input[7:0]i2,input[7:0]i3,input [1:0] key);
	
	reg [7:0]s;
	
	always @ (key or i0 or i1 or i2 or i3)
	begin
		if(key == 0)
			s = i0;
		else if(key == 1)
			s = i1;
		else if(key == 2)
			s = i2;
		else if(key == 3)
			s = i3;
	end
endmodule //--mux2bits

//--************************

module mux3bits(output[7:0]s, input[7:0]i0, input[7:0]i1 , input[7:0]i2 , input[7:0]i3 , input[7:0]i4 , input[7:0]i5,input[7:0]i6,input[7:0]i7, input [2:0] key);
	
	reg [7:0]s;
	
	always @ (key or i0 or i1 or i2 or i3 or i4 or i5 or i6 or i7)
	
	begin
		if(key == 0)
			s = i0;
		else if(key == 1)
			s = i1;
		else if(key == 2)
			s = i2;
		else if(key == 3)
			s = i3;
		else if(key == 4)
			s = i4;
		else if(key == 5)
			s = i5;
		else if(key == 6)
			s = i6;
		else
			s = i7;
	end
endmodule //--mux3bits