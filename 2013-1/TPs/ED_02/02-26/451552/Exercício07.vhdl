// Exemplo07 - BASE
// Nome: Felipe C�ssio Vieira Ferreira 
// Matricula: 451552 
// test number system 
// ------------------------- 
module notg1 (output [7:0]s ,input [7:0]p, input [7:0] q);

assign s = ~(p)+q;

endmodule

module testnotg1; 
// ------------------------- definir dados 
reg [7:0] a, q; 
wire[7:0] s;

notg1 NOT1 (s,a, q);
// ------------------------- parte principal 
initial begin:start 

a= 'b00000010;
q= 1;

end


initial begin 
$display("Exemplo07 - Felipe C�ssio Vieira Ferreira - 451552"); 
$display("Test number system"); 
a= 'b00000010; q=1;
#1 $display("~%b + %b = %b", a, q, s); 
 




 
end
endmodule

// OBS.: SE POSSIVEL, ALTERAR A EXTENSAO PARA .V !