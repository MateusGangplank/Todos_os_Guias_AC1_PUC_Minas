// -------------------------
// Exemplo0032 - F4
// Nome: Lucas Cardoso
// Matricula: 441694
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module BOX1 (output s1,input e1,input e2,input c1);

wire temp1,temp2,notc1;

and AND2 (temp1,e1,c1);
not NOT1 (notc1,c1);
and AND3 (temp2,e2,notc1); 
or OR2 (s1,temp1,temp2);
endmodule//BOX1


module BOX2 (output s,input a,input b,input CH);

wire e1,e2,c1;

and AND1 (e1,a,b);
or OR1 (e2,a,b);
BOX1 selec (s,e1,e2,CH);

endmodule // BOX2
module test_f4;
// ------------------------- definir dados
reg  x,y,z;
wire s,r; 
BOX2 modulo1 ( s, x, y, z);
// ------------------------- parte principal
initial begin  
$display("Exemplo0032 - Lucas Cardoso - 441694");
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