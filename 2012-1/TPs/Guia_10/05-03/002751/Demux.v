//-------------------------------------
// --Nome: Milton costa teles da silva
// --Matricula: 002751
//-- Demultiplexador - Guia 09
//-------------------------------------
module dmx0(output s0, output s1,input a,input key);
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
endmodule //dmx0

module dmx1(output [3:0]s, input x, input [1:0]key);
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
endmodule //dmx1

module dmx2(output [7:0]s, input x, input [2:0]key);
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
endmodule //dmx2
