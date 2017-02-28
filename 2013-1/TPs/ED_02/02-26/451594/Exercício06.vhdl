// ------------------------- 
// Exemplo06 - BASE 
// Nome: Lucas Ranieri 
// Matricula: 451594 
// ------------------------- 
// ------------------------- 
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
$display("Exemplo06 - Lucas Ranieri - 451594"); 
$display("Test number system"); 
a= 'b00000010;
#1 $display("~%b = %b", a, s); 
 




 
end
endmodule