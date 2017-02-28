//-----------------------------------
// Guia0112 -extra
// Nome: Felipe Barros Silva
// Matricula: 376508
//-----------------------------------

//--cria module

module binario (output s, input [7:0] p1);
assign s = ( p1[0] | p1[1] | p1[2] | p1[3] | p1[4] | p1[5] | p1[6] | p1[7]);

endmodule


//--cria module teste de module

module testeBinario;

//-- definir dados
reg [7:0] bin;
wire s;

//-- criar portas


binario b (s, bin );

//-- prepara execução
initial begin: start
bin=00000000;
end


//-- inicia execução
integer n=0;
initial begin
#1 $display ("guia0111 - Felipe Barros - 376508");
#1 $display ("alguem bit 1 que retorna 1 bits");
#1 $display ("abcdefgh  s" );
 while (n< 255) begin
		#1 $monitor ("%b  %b", bin, s);
		#1 bin=bin+1;
		n=n+1;
 end


end
endmodule