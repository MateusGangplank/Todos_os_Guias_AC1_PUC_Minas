 // ------------------------- 
// Exemplo0035 - F4 
// Nome: Lucas Cardoso 
// Matricula: 441694 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module BOX1 (output s1,input e1,input e2,input e3,
input e4,input e5,input e6,input e7, input e8,
input [2:0] c1);
  
wire temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8;
wire notc0,notc1,notc2;

not NOT1 (notc0,c1[0]);
not NOT2 (notc1,c1[1]);
not NOT3 (notc2,c1[2]);
and AND1 (temp1,e1,notc0,notc1,notc2);
and AND2 (temp2,e2,c1[0],notc1,notc2);
and AND3 (temp3,e3,notc0,c1[1],notc2);
and AND4 (temp4,e4,c1[0],c1[1],notc2);
and AND5 (temp5,e5,notc0,notc1,c1[2]);
and AND6 (temp6,e6,c1[0],notc1,c1[2]);
and AND7 (temp7,e7,notc0,c1[1],c1[2]);
and AND8 (temp8,e8,c1[0],c1[1],c1[2]);

or OR1 (s1,temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8);

endmodule//BOX1

module BOX2 (output s,input a,input b,input [2:0] CH);

wire e1,e2,e3,e4,e5,e6,e7,e8,c1;

not NOT4 (e1,b);
or OR2 (e2,a,b);
nor NOR1 (e3,a,b);
and AND9 (e4,a,b);
nand NAND1 (e5,a,b);
xor XOR1 (e6,a,b);
xnor XNOR1 (e7,a,b);
not NOT5 (e8,a);
MUX selec (s,e1,e2,e3,e4,e5,e6,e7,e8,CH);
endmodule////BOX2

module testBOX2;
// ------------------------- definir dados 
reg  x,y;
reg [2:0] z;
wire s,r; 
BOX2 modulo1 ( s, x, y, z);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0035 - Lucas Cardoso - 441694"); 
$display("Test module"); 
x = 'b0; y = 'b0;z= 2'b00; 
// projetar testes do modulo 
$display("\na b CH s");
#1 $monitor("%b %b %b %b",x,y,z,s);
#1 x ='b0; y ='b1; z =3'b000;  
#1 x ='b1; y ='b0; z =3'b000;
#1 x ='b1; y ='b1; z =3'b000;

#1 x ='b0; y ='b0; z =3'b001; 
#1 x ='b0; y ='b1; z =3'b001;  
#1 x ='b1; y ='b0; z =3'b001;
#1 x ='b1; y ='b1; z =3'b001;

#1 x ='b0; y ='b0; z =3'b010; 
#1 x ='b0; y ='b1; z =3'b010;  
#1 x ='b1; y ='b0; z =3'b010;
#1 x ='b1; y ='b1; z =3'b010;

#1 x ='b0; y ='b0; z =3'b011; 
#1 x ='b0; y ='b1; z =3'b011;  
#1 x ='b1; y ='b0; z =3'b011;
#1 x ='b1; y ='b1; z =3'b011;

#1 x ='b0; y ='b0; z =3'b100; 
#1 x ='b0; y ='b1; z =3'b100;  
#1 x ='b1; y ='b0; z =3'b100;
#1 x ='b1; y ='b1; z =3'b100;

#1 x ='b0; y ='b0; z =3'b101; 
#1 x ='b0; y ='b1; z =3'b101;  
#1 x ='b1; y ='b0; z =3'b101;
#1 x ='b1; y ='b1; z =3'b101;

#1 x ='b0; y ='b0; z =3'b110; 
#1 x ='b0; y ='b1; z =3'b110;  
#1 x ='b1; y ='b0; z =3'b110;
#1 x ='b1; y ='b1; z =3'b110;

#1 x ='b0; y ='b0; z =3'b111; 
#1 x ='b0; y ='b1; z =3'b111;  
#1 x ='b1; y ='b0; z =3'b111;
#1 x ='b1; y ='b1; z =3'b111;

end 
endmodule