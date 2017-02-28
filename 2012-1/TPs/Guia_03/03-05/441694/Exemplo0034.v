 // ------------------------- 
// Exemplo0034 - F4 
// Nome: Lucas Cardoso 
// Matricula: 441694 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module BOX1 (output s1,input e1,input e2,input e3,
input e4,input [1:0] c1);
  
wire temp1,temp2,temp3,temp4,notc0,notc1;

not NOT1 (notc0,c1[0]);
not NOT2 (notc1,c1[1]);
and AND1 (temp1,e1,notc0,notc1);
and AND2 (temp2,e2,notc1,c1[0]);
and AND3 (temp3,e3,c1[1],notc0);
and AND4 (temp4,e4,c1[0],c1[1]);
or OR1 (s1,temp1,temp2,temp3,temp4);

endmodule//BOX1

module BOX2 (output s,input a,input b,input [1:0] CH);

wire e1,e2,e3,e4,c1;

or OR2 (e1,a,b);
nor NOR1 (e2,a,b);
xor XOR1 (e3,a,b);
xnor XNOR1 (e4,a,b);
BOX1 selec (s,e1,e2,e3,e4,CH);
endmodule//BOX2

module testBOX2;
// ------------------------- definir dados 
reg  x,y;
reg [1:0] z;
wire s,r; 
BOX2 modulo1 ( s, x, y, z);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0034 - Lucas Cardoso - 441694"); 
$display("Test module"); 
x ='b0; y ='b0; z =2'b00; 
// projetar testes do modulo 
$display("\na b CH s");
#1 $monitor("%b %b %b %b",x,y,z,s);
#1 x ='b0; y ='b1; z =2'b00;  
#1 x ='b1; y ='b0; z =2'b00;
#1 x ='b1; y ='b1; z =2'b00;

x ='b0; y ='b0; z =2'b01; 
#1 x ='b0; y ='b1; z =2'b01;  
#1 x ='b1; y ='b0; z =2'b01;
#1 x ='b1; y ='b1; z =2'b01;

x ='b0; y ='b0; z =2'b10; 
#1 x ='b0; y ='b1; z =2'b10;  
#1 x ='b1; y ='b0; z =2'b10;
#1 x ='b1; y ='b1; z =2'b10;

x ='b0; y ='b0; z =2'b11; 
#1 x ='b0; y ='b1; z =2'b11;  
#1 x ='b1; y ='b0; z =2'b11;
#1 x ='b1; y ='b1; z =2'b11;

end 
endmodule