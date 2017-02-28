// -------------------------
// Exemplo0035 - F4
// Nome: Lucas Cardoso
// Matricula: 441694
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module BOX1 (output s, input f1, input f2, input f3, input f4,
            input f5, input f6, input f7, input f8, input [2:0] c); 
wire p1, p2, p3, p4, p5, p6, p7, p8, notC, notC1, notC2;

not NOT1 (notC,c[0]);
not NOT2 (notC1,c[1]);
not NOT3 (notC2,c[2]);
and AND1 (p1,f1,notC,notC1,notC2);
and AND2 (p2,f2,notC,notC1,c[2]);
and AND3 (p3,f3,notC,c[1],notC2);
and AND4 (p4,f4,notC,c[1],c[2]);
and AND5 (p5,f5,c[0],notC1,notC2);
and AND6 (p6,f6,c[0],notC1,c[2]);
and AND7 (p7,f7,c[0],c[1],notC2);
and AND8 (p8,f8,c[0],c[1],c[2]);
or OR1 (s,p1,p2,p3,p4,p5,p6,p7,p8);

endmodule // BOX1

module BOX2 (output s1,input a, input b,
             input [2:0] chave);
wire w, w1, w2, w3, w4, w5, w6, w7;
				 				
not NOT1 (w,b);
not NOT2 (w1,a);
and AND1 (w2,a,b);
or OR1 (w3,a,b);
nand NAND1 (w4,a,b);
nor NOR1 (w5,a,b);
xor XOR1 (w6,a,b);
xnor XNOR1 (w7,a,b);
BOX1 modulo (s1,w,w1,w2,w3,w4,w5,w6,w7,chave);

endmodule // BOX2

module test_f4;
// ------------------------- definir dados
reg x, y;
reg [2:0]z;  
wire p;

BOX2 modulo (p, x, y, z); 
// ------------------------- parte principal
initial begin  
$display("Exemplo0035 - Lucas Cardoso - 441694");
$display("Test LU's module");
x = 'b0; y = 'b0; z = 3'b000;

// projetar testes do modulo 
#1 $display("\na b chave  s"); 
#1 $monitor("%b %b  %3b   %b",x,y,z,p); 

#1 x = 'b0; y = 'b1; z = 3'b000;
#1 x = 'b1; y = 'b0; z = 3'b000;
#1 x = 'b1; y = 'b1; z = 3'b000;

#1 x = 'b0; y = 'b0; z = 3'b001;
#1 x = 'b0; y = 'b1; z = 3'b001;
#1 x = 'b1; y = 'b0; z = 3'b001;
#1 x = 'b1; y = 'b1; z = 3'b001;

#1 x = 'b0; y = 'b0; z = 3'b010;
#1 x = 'b0; y = 'b1; z = 3'b010;
#1 x = 'b1; y = 'b0; z = 3'b010;
#1 x = 'b1; y = 'b1; z = 3'b010;

#1 x = 'b0; y = 'b0; z = 3'b011;
#1 x = 'b0; y = 'b1; z = 3'b011;
#1 x = 'b1; y = 'b0; z = 3'b011;
#1 x = 'b1; y = 'b1; z = 3'b011;

#1 x = 'b0; y = 'b0; z = 3'b100;
#1 x = 'b0; y = 'b1; z = 3'b100;
#1 x = 'b1; y = 'b0; z = 3'b100;
#1 x = 'b1; y = 'b1; z = 3'b100;

#1 x = 'b0; y = 'b0; z = 3'b101;
#1 x = 'b0; y = 'b1; z = 3'b101;
#1 x = 'b1; y = 'b0; z = 3'b101;
#1 x = 'b1; y = 'b1; z = 3'b101;

#1 x = 'b0; y = 'b0; z = 3'b110;
#1 x = 'b0; y = 'b1; z = 3'b110;
#1 x = 'b1; y = 'b0; z = 3'b110;
#1 x = 'b1; y = 'b1; z = 3'b110;

#1 x = 'b0; y = 'b0; z = 3'b111;
#1 x = 'b0; y = 'b1; z = 3'b111;
#1 x = 'b1; y = 'b0; z = 3'b111;
#1 x = 'b1; y = 'b1; z = 3'b111;

end 
endmodule