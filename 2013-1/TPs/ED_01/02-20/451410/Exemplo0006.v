//...............
//Exemplo0006 - NAND
//Nome: Mateus Lima Batista
//Matricula: 451410
//...............

//...............
//.. NAND gate
//...............
module nandgate(output s, input p, input q);
assign s = (~(p&q));
endmodule//NANDgate
//..............
//.. test nand gate
//..............
module testnandgate;
//................dados locais
reg p,q;
wire s;
nandgate NAND1(s,p,q);
//....... preparacao
initial begin:start
p=0; q=0;
end
//........parte principal
initial begin:main
$display("Exemplo0006 - Mateus Lima Batista - 451410");
$display("Test NAND gate");
$display("\n(~(p&q))=s\n");

$monitor("(~(%b & %b)) = %b", p, q, s);
#1p = 0; q = 1;
#1p = 1; q = 0;
#1p = 1; q = 1;
end
endmodule//testnandgate