//------------------------------
// Guia_04 - soma-completa
// Guilherme Lucindo dos Santos
// 380766
//------------------------------

//-----------------
//--porta meia-soma
//-----------------

module meiasoma (s0, s1, p, q);

output s0,s1;
input p, q;
assign s1 = p & q;

xor XOR (s0, p, q);

endmodule

//---------------------
//-- test soma-completa
//---------------------

module  testemeiasoma;

reg a, b, c;
wire s0, s1, s2, s3, s4;
meiasoma SOMA1 (a, b, s0, s1);
meiasoma SOMA2 (s0, c, s2, s3);
assign s4 = s3 | s1;                // USAR DEFINICAO DE MODULO
                                    // EVITAR USAR EXPRESSOES

initial begin:start
     a=0; b=0; c=0
	  
end

initial begin:main
	$display("Guia 04 - Guilherme Lucindo - 380766");
	$display("teste soma-completa");
	$display("\n a + b = s\n");
	$monitor("%b + %b = %b %b", a, b, s4, s2);
 #1   a=0; b=1;
 #1   a=1; b=0;
 #1   a=1; b=1;

 
 end
 
 endmodule
 
 // OBS.: FAVOR DEIXAR O ARQUIVO COM EXTENSAO .v
 
 //       REVER O ENUNCIADO E REFAZER. 