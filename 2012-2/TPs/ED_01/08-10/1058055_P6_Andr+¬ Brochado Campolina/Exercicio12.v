//-----
//Exercicio12
//Andre Campolina
//381217
//-----

//---
//or 1byte
//---

module orbyte(output s, input [0:7] p);
	assign s = p[0]|p[1]|p[2]|p[3]|p[4]|p[5]|p[6]|p[7];
endmodule

//---
//testar
//---

module testaor;
	reg [0:7] a;
	wire s;
	
	orbyte OR8(s,a);
	
	initial begin:start
		a=0;
	end
	
	initial begin
		$display("Exercicio12 - Andre Campolina - 381217");
		$display("Tabela Verdade porta OR 1 byte");
		$display("\na b c d\ts\n");
		$monitor("%b \t%b",a,s);
		#1 a=1;
		#1 a=2;
		#1 a=3;
		#1 a=4;
		#1 a=5;
		#1 a=6;
		#1 a=7;
		#1 a=8;
		#1 a=9;
		#1 a=10;
		#1 a=11;
		#1 a=12;
		#1 a=13;
		#1 a=14;
		#1 a=8'b11111111;
	end
endmodule