// -------------------------
// Exercicio09 - AND 
// Nome: Luhan Mairinck 	 
// Matricula: 446987 
// ------------------------- 

// ------------------------- 
// -- and gate 
// ------------------------- 

module andgate1 (output s1, 
                 input p, 
                 input q); 
					  
assign s1 = p & q; 
endmodule // andgate1 

module andgate (output s, 
                input s1,
					 input r);
					 	
assign s = s1 & r;
endmodule // andgate

// --------------------- 
// -- test and gate 
// --------------------- 

module testandgate; 

// ------------------------- dados locais 
reg a, b, c; // definir registradores 

wire s,s1; // definir conexao (fio) 

// ------------------------- instancia 
andgate AND1 (s1, a, b);                 // DEFINIR EM OUTRO MODULO
andgate AND2 (s, s1, c);

// ------------------------- preparacao 
initial begin:start
 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; c=0;
end 

// ------------------------- parte principal 
initial begin 
$display("Exercicio09 - Luhan Mairinck - 446987"); 
$display("Test AND gate"); 
$display("\na & b & c = s\n"); 

$monitor ("%b & %b & %b = %b", a, b, c, s); 
#1 a=0; b=0; c=0;

#1 a=0; b=0; c=1;

#1 a=0; b=1; c=0;

#1 a=0; b=1; c=1;

#1 a=1; b=0; c=0; 

#1 a=1; b=0; c=1;

#1 a=1; b=1; c=0;
 
#1 a=1; b=1; c=1;

end 
endmodule // testandgate 