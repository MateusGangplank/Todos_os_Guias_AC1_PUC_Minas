// -------------------------
// Exemplo0003 - AND
// Nome: Thais Mairink
// Matricula: 441710
// -------------------------


//-----------------
//--and gate
//-----------------
module andgate(output s, input p, input q);
assign s = p & q;
endmodule //andgate

//-------------
//--test ant gate
//---------------
module tesandgate;
//--------------dados locais
reg a, b;   //definir registradores
wire s;     //definir conexao(fio)

//------------instancia
andgate AND1 (s,a,b);

//------------preparacao
initial begin: start  //atribuicao simultanea dos valores iniciais

a=0; b=0;
end


//-------------Parte Principal
initial begin
	$display("Exemplo0003 - Thais Mairink - 441710");
	$display("Test AND gate");
	$display("%\na & b = s\n");
	a=0; b=0;
#1 $display("%b & %b = %b", a,b,s);
	a=0; b=1;
#1 $display("%b & %b = %b", a,b,s);
	a=1; b=0;
#1 $display("%b & %b = %b", a,b,s);
	a=1; b=1;
#1 $display("%b & %b = %b", a,b,s);
end

endmodule //testandgate