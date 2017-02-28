// -------------------------
// Exercicio12 - OR
// Nome: Ádamo Ludwig
// Matricula: 473319
// -------------------------
// -------------------------
// -- NOR gate
// -------------------------
module ORgate ( output s,
                         input [0:7] p);
wire temp0 , temp1, temp2, temp3, temp4, temp5, temp6, temp7; 
or OR0 (temp0, p[0], p[1]);
or OR1 (temp1, temp0, p[2]);
or OR2 (temp2, temp1, p[3]);
or OR3 (temp3, temp2, p[4]);
or OR4 (temp4, temp3, p[5]);
or OR5 (temp5, temp4, p[6]);
or OR6 (temp6, temp5, p[7]);
//OR OR7 (temp6, )
//assign st = (~(temp0|temp1|temp2|temp3|temp4|temp5|temp6));
assign s = temp6;
endmodule // ORgate
// ---------------------
// -- test OR gate
// ---------------------
module testORgate;
// ------------------------- dados locais
   reg  [0:7]a; // definir registradores
   wire  s;    // definir conexao (fio)
// ------------------------- instancia
   ORgate OR1 (s, a[0:7]);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0 ;
   end
// ------------------------- parte principal
   initial begin
         $display("Exercicio12 - Adamo Ludwig - 473319");
         $display("Test OR gate");
         $display("\na | b = s\n");
		 $monitor("%b = %b", a, s);
  #1       a=8'b00000000; 
  #1       a=8'b11111111; 
 // #1   $display("%b & %b = %b", a, s);
          // a=1; 
 // #1   $display("%b & %b = %b", a, s);
        //   a=1;
 // #1   $display("%b & %b = %b", a, s);
end
endmodule // testORgate