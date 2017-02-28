// Exemplo0025 - COMPLEMENTO DE 2
// Nome: Jonatas Sena Ferreira
// Matricula: 427424

module complement1(output s, input a);

	not NOT1(s,a);

endmodule // complement1

module halfAdder(output s1, output s0, input a, input b);

	xor XOR1(s0,a,b);
	and AND1(s1,a,b);
endmodule //halfAdder

module Complement2(output [0:5]s, input [0:5]a);

	wire [0:5]s0;
	wire [0:6]s1;

	complement1 C1(s0[5],a[5]);
	complement1 C2(s0[4],a[4]);
	complement1 C3(s0[3],a[3]);
	complement1 C4(s0[2],a[2]);
	complement1 C5(s0[1],a[1]);
	complement1 C6(s0[0],a[0]);
	
	not NOT1(s1[6],a[5]);
	xor XOR1(s1[5],a[5],s1[6]);
	
	halfAdder H1(s1[4],s[5],s0[5],s1[5]);
	halfAdder H2(s1[3],s[4],s0[4],s1[4]);
	halfAdder H3(s1[2],s[3],s0[3],s1[3]);
	halfAdder H4(s1[1],s[2],s0[2],s1[2]);
	halfAdder H5(s1[0],s[1],s0[1],s1[1]);
	xor XOR2(s[0],s0[0],s1[0]);

endmodule //Complement2

//------------------
module testComplement2;

reg [0:5]a = 6'b000000;
wire [0:5]s;

Complement2 C1(s,a);


initial
	begin

	$display ("Exemplo0025 - Jonatas Sena Ferreira - 427424");
	$display ("COMPLEMENTO DE 2 ");
	
	#1 $display ("C2(%b) = %b",a,s);
		a = 6'b110011;
	#1 $display ("C2(%b) = %b",a,s);
		a = 6'b010110;
	#1 $display ("C2(%b) = %b",a,s);
		a = 6'b011110;
	#1 $display ("C2(%b) = %b",a,s);
	
	end

endmodule //testComplement2