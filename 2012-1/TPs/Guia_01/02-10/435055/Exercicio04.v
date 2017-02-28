// Exercicio04 - nand 
// Nome: Samuel Eus�bio da Silva
// Matricula: 435055

// nand gate

	module nandgate (output s, input p, input q);
	assign s = (~(p)|~(q));
	endmodule //--nand
	
	//--test nadgate
	
	module testnandgate;
	
	reg a,b;
	wire s;
	
	nandgate NAND2 (s, a, b);
	
	initial begin:start
	a=0;b=0;
	end
	
	initial begin:main
	$display("Exercicio04 - Samuel Eus�bio da Silva - 435055"); 
	$display("Test nand gate");
	$display("\n (~(a)|~(b)) = s\n");
	a=0; b=0;
	#1 $display("%b ~|~ %b = %b", a, b, s);
	a=0; b=1;
	#1 $display("%b ~|~ %b = %b", a, b, s);
	a=1; b=0;
	#1 $display("%b ~|~ %b = %b", a, b, s);
	a=1; b=1;
	#1 $display("%b ~|~ %b = %b", a, b, s);
	end
	endmodule //--testnandgate