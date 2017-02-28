// ---------------------
// Guia07
// Nome: Lucas Teixeira Santos
// Matricula: 415383
// ---------------------

module meiasoma (a,b,s0,s1);
output s0,s1;
input  a, b;
assign s1 = a & b;
xor XOR (s0,a,b);
endmodule

module somacompleta(a,b,cin,s0,s1);
output s0,s1;
input a,b,cin;
wire c1,c2;
meiasoma HA (cin,a,s,c1);
meiasoma HA2 (s,b,s0,c2);
assign s1 = c1 | c2;
endmodule
    
module soma4b(a,b,s);
output [3:0]s;
input [3:0]a;
input [3:0]b;
wire c0,c1,c2,cout;
meiasoma HA (a[0],b[0],s[0],c0);
somacompleta FA1 (a[1],b[1],c0,s[1],c1);
somacompleta FA2 (a[2],b[2],c1,s[2],c2);
somacompleta FA3 (a[3],b[3],c2,s[3],cout); //Cout descartado
endmodule
	 
module C2 (b,s);
input [3:0]b;
output [3:0]s;
wire [3:0]bnot;
reg [3:0]maisum;
initial begin 
maisum = 4'b0001;
end
not NOT1 (bnot[0],b[0]);
not NOT2 (bnot[1],b[1]);
not NOT3 (bnot[2],b[2]);
not NOT4 (bnot[3],b[3]);
soma4b SOMA (bnot,maisum,s);
endmodule	 

module C1 (b,s);	 
input [3:0]b;
output [3:0]s;
not NOT1 (s[0],b[0]);
not NOT2 (s[1],b[1]);
not NOT3 (s[2],b[2]);
not NOT4 (s[3],b[3]);
endmodule	 

module add1 (a,s);
input [3:0]a;
output [3:0]s;
reg [3:0]maisum;
initial begin 
maisum = 4'b0001;
end
soma4b SOMA (a,maisum,s);
endmodule	

module sub1 (a,s);
input [3:0]a;
output [3:0]s;
reg [3:0]maisum;
initial begin 
maisum = 4'b1111;
end
soma4b SOMA2 (a,maisum,s);
endmodule	

module multi2 (a,s);
input [3:0]a;
output [4:0]s;
assign s[0] = 0;
assign s[1] = a[0];
assign s[2] = a[1];
assign s[3] = a[2];
assign s[4] = a[3];
endmodule	

module testexs;
reg [3:0]a;
wire [3:0]cp1;
wire [3:0]cp2;
wire [3:0]dec1;
wire [3:0]inc1;
wire [4:0]mul2;

add1 ADDUM (a,inc1);
sub1 SUBUM (a,dec1);
C1 COMP1 (a,cp1);
C2 COMP2 (a,cp2);
multi2 X2 (a,mul2);

initial begin
      $display("Guia 07 - Lucas Teixeira Santos - 415383");
      $display("AAAA|   *2    |   C1   |   C2   |   +1   |   -1   ");
a = 4'b0000;
#1	 $monitor("%4b|  %5b  |  %4b  |  %4b  |  %4b  |  %4b", a, mul2, cp1,cp2,inc1,dec1);
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
 end

endmodule 
/* test
    AAAA|   *2    |   C1   |   C2   |   +1   |   -1   
    0000|  00000  |  1111  |  0000  |  0001  |  1111
    0001|  00010  |  1110  |  1111  |  0010  |  0000
    0010|  00100  |  1101  |  1110  |  0011  |  0001
    0011|  00110  |  1100  |  1101  |  0100  |  0010
    0100|  01000  |  1011  |  1100  |  0101  |  0011
    0101|  01010  |  1010  |  1011  |  0110  |  0100
    0110|  01100  |  1001  |  1010  |  0111  |  0101
    0111|  01110  |  1000  |  1001  |  1000  |  0110
    1000|  10000  |  0111  |  1000  |  1001  |  0111
    1001|  10010  |  0110  |  0111  |  1010  |  1000
    1010|  10100  |  0101  |  0110  |  1011  |  1001
    1011|  10110  |  0100  |  0101  |  1100  |  1010
    1100|  11000  |  0011  |  0100  |  1101  |  1011
    1101|  11010  |  0010  |  0011  |  1110  |  1100
    1110|  11100  |  0001  |  0010  |  1111  |  1101
    1111|  11110  |  0000  |  0001  |  0000  |  1110
/*