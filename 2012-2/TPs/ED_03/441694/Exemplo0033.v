// -------------------------
// Exemplo0033 - F4
// Nome: Lucas Cardoso
// Matricula: 441694
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module BOX1 (output s1,output s2,input e1,input e2,input e3,
input e4,input c1);
  
wire temp1,temp2,temp3,temp4,notc1;

and AND1 (temp1,e1,c1);
not NOT1 (notc1,c1);
and AND2 (temp2,e2,notc1); 
or OR1 (s1,temp1,temp2);

and AND2 (temp3,e3,c1);
not NOT1 (notc1,c1);
and AND2 (temp4,e4,notc1); 
or OR2 (s2,temp3,temp4);

endmodule//BOX1

module BOX2 (output s,output s0,input a,input b,input CH);

wire e1,e2,e3,e4,c1;

nand NAND1 (e1,a,b);
and AND3 (e2,a,b);
nor NOR1 (e3,a,b);
or OR3 (e4,a,b);
BOX1 selec (s,s0,e1,e2,e3,e4,CH);
endmodule//BOX2

module test_f4;
// ------------------------- definir dados
reg  x,y,z;
wire s,r; 
BOX2 modulo1 ( s, r, x, y, z);
// ------------------------- parte principal
initial begin  
$display("Exemplo0033 - Lucas Cardoso - 441694");
$display("Test LU's module");
x ='b0; y ='b0;z ='b0;
// projetar testes do modulo
$display("\na b CH s");
#1 $monitor("%b %b %b  %b",x,y,z,s);
#1 x ='b0;y ='b1; z ='b0;  
#1 x ='b1;y ='b0; z ='b0;
#1 x ='b1;y ='b1; z ='b0;
#1 x = 'b0; y ='b0;z ='b1; 
#1 x ='b0; y ='b1; z ='b1;  
#1 x ='b1; y ='b0; z ='b1;
#1 x ='b1; y ='b1; z ='b1;

end
endmodule // test_f4