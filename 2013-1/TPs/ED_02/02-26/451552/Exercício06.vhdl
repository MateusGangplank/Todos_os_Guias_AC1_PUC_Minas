// Exemplo06 - BASE 
// Nome: Felipe Cássio Vieira Ferreira 
// Matricula: 451552 
// test number system 
// ------------------------- 
module notg1 (output [7:0]s ,input [7:0]p);

assign s = ~(p);

endmodule

module testnotg1; 
// ------------------------- definir dados 
reg [7:0] a; 
wire[7:0] s;

notg1 NOT1 (s,a);
// ------------------------- parte principal 
initial begin:start 

a= 'b00000010;

end


initial begin 
$display("Exemplo06 - Felipe Cássio Vieira Ferreira - 451552"); 
$display("Test number system"); 
a= 'b00000010;
#1 $display("~%b = %b", a, s); 
 




 
end
endmodule