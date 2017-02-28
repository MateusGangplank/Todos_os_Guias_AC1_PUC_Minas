//-------------------------------------
// --Nome: Milton costa teles da silva
// --Matricula: 002751
//-- multiplexador - Guia 09
//-------------------------------------
module mux0(output [3:0]s, input [3:0]i0,
				input [3:0]i1, input key);
	
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
endmodule //mux0

module mux1(output [7:0]s, input [7:0]i0,
				input [7:0]i1, input key);
	
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
endmodule //mux1

module mux2(output[7:0]s, input[7:0]i0, input[7:0]i1,
					input[7:0]i2,input[7:0]i3,input [1:0] key);
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
endmodule //mux2

module mux3(output[7:0]s, input[7:0]i0, input[7:0]i1,
					input[7:0]i2,input[7:0]i3,input[7:0]i4,
					input[7:0]i5,input[7:0]i6,input[7:0]i7, input [2:0] key);
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
endmodule //mux3bits
