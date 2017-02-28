// -------------------------
// Extra02 - COMPLEMENTO DE DOIS
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------

// -------------------------
//  complemento de dois
// -------------------------

module c2byte (output[0:7] s, input[0:7] p);
  assign s = (~p)+1;
endmodule

// -------------------------
//  complemento de dois
// -------------------------

module testbytegate;

// ------------------------- dados locais
reg  [0:7] a;
wire [0:7] s;

// ------------------------- instancia
c2byte compl_dois (s, a);


// ------------------------- preparacao
initial begin:start
  a=8'b11011010;
end


// ------------------------- parte principal
initial begin:main

  $display("Extra02 - DavidsonFrancis - 466499");
  $display("Teste complemento de 2:"); 
  $monitor("%b | %b | %b | %b | %b | %b | %b | %b = %b", a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],s);

  end
endmodule // teste complemento de 2
