module dmx(output[3:0] outp , input inp, input[1:0] addr);
 reg[3:0] x;
 parameter         // state identifiers  
 start    = 2'b00, 
 id01      = 2'b01, 
 id10    = 2'b10, 
 id11  = 2'b11; 
always @(addr)
begin
case(addr)
start:
	x = 4'b1000;
id01:
	x = 4'b0100;
id10:
	x = 4'b0010;
id11:
	x = 4'b0001;
default:
	x = 4'bxxxx;
endcase	 					
end
assign outp = x;
endmodule

module mux(output[7:0] outp,input[7:0] i0,input[7:0] i1,input[7:0] i2,input[7:0] i3, input[1:0] addr);
reg[7:0] x;
parameter         // state identifiers  
 start    = 2'b00, 
 id01      = 2'b01, 
 id10    = 2'b10, 
 id11  = 2'b11;
always @(addr)
begin
case(addr)
start:
	x = i0;
id01:
	x = i1;
id10:
	x = i2;
id11:
	x = i3;
default:
	x = 4'bxxxx;
endcase
end
assign outp = x;
endmodule






module Test;
wire[7:0] outp;
reg[7:0] i0 = 8'b00000000;
reg[7:0] i1 = 8'b00000001;
reg[7:0] i2 = 8'b00000010;
reg[7:0] i3 = 8'b00000011;
reg[1:0] addr;
mux p1(outp,i0,i1,i2,i3,addr);
initial
begin
addr = 2'b00;
#1 $display("%4b",outp);
addr = 2'b11;
#1 $display("%4b",outp);
#300 $finish;
end
endmodule