//------------------------- 
// Exemplo0033 - F4 
// Nome: Wellington Santos Corrêa
// Matricula: 472047
// -------------------------
// -------------------------
// f4_gate
// ------------------------- 
module f1(output s0, output s1, input x, input y, input chave);
wire temp0, temp1, temp2, temp3, mtemp0, mtemp1, mtemp2, mtemp3, nchave;
  and AND1(temp0, x, y);
  or OR1(temp1, x, y);
  nand NAND1(temp2, x, y);
  nor NOR1(temp3, x, y);

//-------Multiplexador---------
not NOT1(nchave, chave);
and AND2(mtemp0, temp0, nchave);
and AND3(mtemp1, temp1, nchave);
and AND4(mtemp2, temp2, chave);
and AND5(mtemp3, temp3, chave);
or OR2(s0, mtemp0, mtemp2);
or OR3(s1, mtemp1, mtemp3);
endmodule 

// ----- parte principal-------
module test;
reg x, y, chave;
wire sa0, sa1;
f1 Test(s0, s1, x, y, chave);
initial begin 
$display("Exemplo0033 - Wellington Santos Corrêa - 472047"); 
$display("Test LU's module");
x = 1;
y = 0;
chave = 0;
#1 $display("X AND Y & X OR Y =%3b &%3b", s0, s1 );
chave = 1;
#1 $display("X NAND Y & X NOR Y =%3b &%3b", s0, s1);  
end 
endmodule // test_f4 