// ----------------------
// Guia 05
// Nome: Karen Alves Pereira
// Matricula: 407451
// -----------------------

//-- Soma completa 4 bits
 module somacompleta4bits (s,x,y);
 output [4:0] s;
 input [3:0] x, y;
 
 wire c1, c2, c3;


 meiasoma HA1 (s[0],c1,x[0],y[0]);
 somacompleta FA1 (s[1],c2,x[1],y[1],c1);
 somacompleta FA2 (s[2],c3,x[2],y[2],c2);
 somacompleta FA3 (s[3],s[4],x[3],y[3],c3);

 endmodule 

//-- Meia Soma
 module meiasoma(s0, s1,x, y);    
 output s0, s1;                  
 input x, y;                     

 xor XOR1(s0, x, y);
 and AND1(s1, x, y);
 
 endmodule

// -- Soma Completa 
 module somacompleta(s0, s1, x, y, v1);
 output s0, s1;
 input x, y, v1;
 wire s4, s5, s2;
 
 meiasoma HA1(s2, s4, x, y);
 meiasoma HA2(s0, s5, s2, v1);
 or OR1(s1,s5,s4);
 
 endmodule
 
 module multiplicador(s0,s,carry,a,b);
 output [3:0]s0;
 output carry,s;
 input [3:0]a,b; 

 and AN1 (s[1],b[3],a[3]);
 and AN2 (s[2],b[3],a[2]);
 and AN3 (s[3],b[3],a[1]);
 and AN4 (s[4],b[2],a[3]);
 and AN5 (s[5],b[2],a[2]);
 and AN6 (s[6],b[2],a[1]);
 and AN7 (s[7],b[1],a[3]);
 and AN8 (s[8],b[1],a[2]);
 and AN9 (s[9],b[1],a[1]);
 
 module somacompleta4bits (s,a,b);
  
 endmodule