// Giselle Caroline Vieira
// Matricula: 424649

module meiasoma (c, s, a, b);

output c, s;
input a, b;

and AND1 (s, a, b);
xor XOR1 (c, a, b);

endmodule 

module somacompleta (c1, s1, a1, b1, cin);

output c1, s1;
input a1, b1, cin;
wire temp1, temp2, temp3;

meiasoma meiasoma1 (temp1, temp2, a1, b1);
meiasoma meiasoma2 (s1, temp3, cin, temp1);
or Or1 (c1, temp3, temp2);

endmodule 

module TesteSomacompleta;

wire c2, s2;
reg a, b, cin1;

somacompleta somacompleta1 (c2, s2, a, b, cin1);

 initial begin
      $display("\na  b  Cin    C  s\n");
      $monitor("%b  %b   %b    %b    %b", a, b, cin1,c2, s2);
  
	     a=0; b=0; cin1 =0;
    #1  a=0; b=0; cin1 =1; 
    #1  a=0; b=1; cin1 =0;
    #1  a=0; b=1; cin1 =1; 
	 #1  a=1; b=0; cin1 =0;
    #1  a=1; b=0; cin1 =1; 
    #1  a=1; b=1; cin1 =0;
    #1  a=1; b=1; cin1 =1; 
	  
    end
endmodule