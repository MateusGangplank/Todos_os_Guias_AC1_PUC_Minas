//------------------------------
// Guia_04 - meio-subtrator
// Guilherme Lucindo dos Santos
// 380766
//------------------------------

//-----------------------
//--porta meia-subitração
//-----------------------

module meiasoma (a, b, s0, s1);

output s0,s1;
input a, b;
assign s1 = a & q;

xor XOR (s0, a, b);

endmodule

//---------------------
//-- test soma-completa
//---------------------

module  testemeiasoma;

reg a, b, c;
wire s0, s1, s2, s3, s4;
meiasoma SOMA1 (a, b, s0, s1);
meiasoma SOMA2 (s0, c, s2, s3);
assign s4 = s3 | s1;


initial begin:start
     a=0; b=0; c=0;
	  
end

initial begin:main
	$display("Guia 04 - Guilherme Lucindo - 380766");
	$display("teste soma-completa");
	$display("\n a + b = s\n");
	$monitor("%b + %b = %b %b", a, b, s4, s2);
 #1   a=0; b=0; c=1;
 #1   a=0; b=1; c=0;
 #1   a=0; b=1; c=1;
 #1   a=1; b=0; c=0;
 #1   a=1; b=0; c=1;
 #1   a=1; b=1; c=0;
 #1   a=1; b=1; c=1;

 
 end 
 
 endmodule