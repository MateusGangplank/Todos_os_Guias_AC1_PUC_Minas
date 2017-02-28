// -------------------------
// Exemplo0015 - COMPLEMENTOS
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------

// -------------------------
// test number system
// -------------------------

module test_base_01;

// ------------------------- parte principal
initial begin
   $display("Exemplo0015 - Davidson Francis - 466499");
   $display("Test number system");
   
   $display("\nComplements");
   $display("0= %d = %3b = %3b", ~1 , (1-1), ~1 );
   $display("1= %d = %3b = %3b", ~0 , (2-1), ~0 );
   $display("2= %d = %3b = %3b", (1+1), (3-1), ~0+~0);
end
endmodule // test_base
