// ---------------------
// Guia08
// Nome: Daniel Sathler Silva
// Matricula: 405795
// ---------------------

// ---------------------
// -- Exercicio 1
// ---------------------

module exe1(s,a,b,c,d);

	output s;
	input a,b,c,d;
	
	wire a1,a2,a3;

	and and1(a1,a,b,~d);
	and and2(a2,~a,c);
	and and3(a3,~b,c);
	
	or or1(s,a1,a2,a3);
	
endmodule

// ---------------------
// -- Exercicio 2
// ---------------------

module exe2(s,a,b,c,d);
	
	output s;
	input a,b,c,d;
	
	wire a1,a2,a3,a4,a5;
	
	and and1(a1,~a,~b,~d);
	and and2(a2,~a,~c,~d);
	and and3(a3,a,~b,~c);
	and and4(a4,a,~b,d);
	and and5(a5,a,~c,d);
	
	or or1(s,a1,a2,a3,a4,a5);
	
endmodule

// ---------------------
// -- Exercicio 3
// ---------------------

module exe3(s,a,b,c,d,e);
	
	output s;
	input a,b,c,d,e;
	
	wire a1,a2,a3,a4,a5,a6;
	
	and and1(a1,a,b,d,e);
	and and2(a2,~a,~c,~d);
	and and3(a3,~b,c,~d);
	and and4(a4,b,c,d);
	and and5(a5,~b,~d,e );
	and and6(a6,c,e );
	
	or  or1(s,a1,a2,a3,a4,a5,a6);
	
endmodule

// ---------------------
// -- teste
// ---------------------
module teste;

	reg a,b,c,d,e;
	wire s1,s2,s3;

	exe1 exe01(s1,a,b,c,d);
	exe2 exe02(s2,a,b,c,d);
	exe3 exe03(s3,a,b,c,d,e);
	
	initial begin
		
		$display("Daniel Sathler Silva - 405795");
        $display("Teste Guia08. Atenção: Considerar váriavel E apenas para S3.");
		$display("A B C D E - S1 S2 S3");
		$monitor("%b %b %b %b %b =  %b %b %b", a,b,c,d,e,s1,s2,s3);
		#1 a=0; b=0; c=0; d=0; e=0;
		#1 a=1; b=0; c=0; d=0; e=0;
		#1 a=0; b=1; c=0; d=0; e=0;
		#1 a=1; b=1; c=0; d=0; e=0;
		#1 a=0; b=0; c=1; d=0; e=0;
		#1 a=1; b=0; c=1; d=0; e=0;
		#1 a=0; b=1; c=1; d=0; e=0;
		#1 a=1; b=1; c=1; d=0; e=0;
		#1 a=0; b=0; c=0; d=1; e=1;
		#1 a=1; b=0; c=0; d=1; e=1;
		#1 a=0; b=1; c=0; d=1; e=1;
		#1 a=1; b=1; c=0; d=1; e=1;
		#1 a=0; b=0; c=1; d=1; e=1;
		#1 a=1; b=0; c=1; d=1; e=1;
		#1 a=0; b=1; c=1; d=1; e=1;
		#1 a=1; b=1; c=1; d=1; e=1;  
	end
	
endmodule //teste	
	