// -------------------------
// Exercicio 0009 
// Nome: Miller 
// Matricula: 449048 
// -------------------------
// --------AND 3/2 ---------

// FAVOR NAO DEIXAR ESPACO EM BRANCO NO NOME DO ARQUIVO

// VER SUGESTAO NO PROXIMO EXERCICIO

module inicio(output x, input a, input b);
assign x = a&b;
endmodule

module final(output w, input j, input k);
assign w = j&k;
endmodule // -- Neste modulo um dos parametros sera o resultado do modulo anterior.

module variaveis;
reg r, s, t;
wire p, q;

inicio primeiro(p, r, s);
initial begin:start
r=0; s=0;
end

final segundo(q, p, t);
initial begin:starttwo
t=0;
end

initial begin

$display("MILLER - 449048");
$display("AND com 3 entradas, utilizando 2 portas de 2 entradas.");
$display(" ");
$monitor("( %b & %b & %b = %b )", r, s, t, q);

#1 
#1 r=1;
#1 r=1; s=1;
#1 r=0; s=0; t=1;
#1 s=1;
#1 t=0;
#1 r=1; t=1;
#1 r=1; s=1; t=1;

end
endmodule
// -- fim do aplicativo.