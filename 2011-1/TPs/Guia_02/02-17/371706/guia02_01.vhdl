//---------------
//Marley Diniz
//371706
//guia02_01
//---------------


//-- nand gate

module nandgate (s, p, q);
	output s;
	input p, q;
	
	assing s = ~(p & q);

endmodule //nand

//-- or gate with nand

module orgate (s0, p, q);
	output s0;
	wire s1, s2;
	input p, q;
	
	nandgate NAND1 (s1, p, p);
	nandgate NAND2 (s2, q, q);
	nandgate NAND3 (s0, s1, s2);
	
endmodule //or

//-- teste or gate with nand

module testorgate;
	reg a, b;
	wire s;
	
	orgate OR1 (s, a, b);
	
	initial begin:start
		a = 0; b = 0;
	end
	
	//principal
	initial begin:main
		$display("Marley Diniz -- 371706");
		$display("Teste OR gate");
		$display("\n~(~%a & ~%b) = s\n");
		$monitor("~(~%b~ & ~%b) = %b", a, b, s);
	#1	a=0;	b=1;
	#1	a=1;	b=0;
	#1	a=1;	b=1;
	end
endmodule