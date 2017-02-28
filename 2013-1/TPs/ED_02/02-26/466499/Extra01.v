// -------------------------
// Extra01 - COMPLEMENTO DE UM
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------

// -------------------------
//  complemento de um
// -------------------------

module c1byte (output[0:7] s, input[0:7] p);
  assign s = ~p;
endmodule

// -------------------------
//  complemento de um
// -------------------------

module testbytegate;

// ------------------------- dados locais
reg [0:7] a;
wire[0:7] s;

// ------------------------- instancia
c1byte compl_um (s, a);


// ------------------------- preparacao
initial begin:start
  a=8'b10110110;
end


// ------------------------- parte principal
initial begin:main

  $display("Extra01 - DavidsonFrancis - 466499");
  $display("Teste complemento de 1:"); 
  $monitor("%b | %b | %b | %b | %b | %b | %b | %b = %b", a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],s);

  end
endmodule // teste complemento de 1
