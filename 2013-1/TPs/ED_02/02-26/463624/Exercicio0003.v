// ------------------------- 
// Exercicio3
// Nome: Mateus Cunha da Silva 
// Matricula: 463624 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 

module exercicio03; 
// ------------------------- definir dados 
reg [6:0] a; 
reg [5:0] b; 
reg [5:0] c; 
reg [6:0] d; 
reg [4:0] e;

// ------------------------- parte principal 
initial begin 
$display("Exercicio003 - Mateus Cunha da Silva - 463624"); 
$display("Test number system");

a = ~7'b0101010 + 7'b0000001; // 6 bits amplitude e 1 pro sinal.
b = ~6'o25 + 6'b000001; // 5 bits amp e 1 sign.
c = ~6'd27 + 6'b000001; 
d = ~7'h2C + 7'b0000001;
e = ~5'd10 + 5'b00001;

$display ("  ~[0]101010 = [%b]%b = %d",a[6], a[5:0],a + 7'b0101010 );
$display ("  ~o25 = [%b]%b = %d ",b[5], b[4:0], b + 6'o25);
$display ("  ~27 = [%b]%b  ",c[5], c[4:0], c + 6'd27 );
$display ("  ~h2C = [%b]%b  ",d[6], c[5:0], d + 7'h2C );
$display ("  ~27 = [%b]%b  ",d[4], c[3:0], e + 5'd10);

  
end 
endmodule // test_base


