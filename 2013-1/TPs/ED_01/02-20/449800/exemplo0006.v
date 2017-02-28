// Nome: Matheus Filipe Sieiro Vargas
// Matricula: 451601
module nandgate (output s , input p , input q);
assign s = ~(p&q);
endmodule

module testenandgate;
reg a,b;
wire s;

nandgate nand1 (s,a,b);
initial begin 
a=0;
b=0;
end
initial begin
$display("blabla");
#1 $display("%b & %b = %b",a,b,s);

a=0;
b=1;
#1 $display("%b & %b = %b",a,b,s);

a=1;
b=0;
#1 $display("%b & %b = %b",a,b,s);

a=1;
b=1;
#1 $display("%b & %b = %b",a,b,s);
end 

endmodule
