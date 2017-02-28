// -------------------------
// Extra02 - BYTE
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------

// -------------------------
// -- BYTE gate
// -------------------------

module bytegate (output s, input[0:7] p);
  wire temp1,temp2,temp3,temp4,temp5,temp6,temp7;
  
  or OR1(temp1, p[0], p[1]);
  or OR2(temp2, temp1, p[2]);
  or OR3(temp3, temp2, p[3]);
  or OR4(temp4, temp3, p[4]);
  or OR5(temp5, temp4, p[5]);
  or OR6(temp6, temp5, p[6]);
  or OR7(temp7, temp6, p[7]);

  assign s = temp7;
endmodule

// -------------------------
// -- test byte gate
// -------------------------

module testbytegate;

// ------------------------- dados locais

reg [0:7] a;
wire s; // definir conexao (fio)

// ------------------------- instancia
bytegate BYTE1 (s, a);
// ------------------------- preparacao

initial begin:start
  a=8'b00001000;
end

// ------------------------- parte principal

initial begin:main
               // execucao unitaria
  $display("Extra02 - DavidsonFrancis - 466499");
  $display("Test BYTE gate:"); 
  $monitor("%b | %b | %b | %b | %b | %b | %b | %b = %b", a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],s);

  end
endmodule // testbytegate
