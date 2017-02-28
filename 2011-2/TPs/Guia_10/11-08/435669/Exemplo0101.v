/*
---------------------------------------
PUC-Minas - Ciência da Computação 
ARQ1 – Guia 09 
Período: 03-07/10/2011 
--------------------------------------------------------
Tema: Introdução à linguagem Verilog 
Atividade: Circuitos sequenciais – Memórias 
Todos os circuitos deverão ser simulados no Logisim. 

Nome: Mateus Augusto Moraes Ferreira   Matricula: 435669
--------------------------------------------------------
01.) Projetar e descrever em Verilog e Logisim um módulo 
para implementar uma memória RAM 1x4 
(1 endereço para 4 bits) 
usando flip-flops do tipo JK como registradores de dados. 
Ver sugestão abaixo. 

DICA:  
Supor que a escrita ocorrerá na borda de subida do c l o ck , 
enquanto a leitura poderá ocorrer a partir da 
borda de descida do mesmo. 
--------------------------------------------------------
*/
//---------------------
//--  FLIP FLOOP JK  --
//---------------------
module jkff ( output q, output qnot,
              input j, input k, input clk,input clear);
reg q, qnot;
initial
begin
q = 1'b0;
qnot = ~q;
end

always @( posedge clk )
begin
if ( clear )
  begin
   q <= 0;  qnot <= ~q;
  end
  else
    if ( j & ~k )
     begin
      q <= 1; qnot <= 0;
     end
    else
      if ( ~j & k )
       begin
        q <= 0; qnot <= 1;
       end
      else
        if ( j & k )
         begin
          q <= ~q; qnot <= ~qnot;
         end
end
endmodule // jkff

//-----Module RAM-----

module ram1x1(output s0,output q, output qnot,input address,input rw,input clk,input x,input clr);

wire y;

and AND1(y,address,clk,rw);
jkff jk1(q,qnot,x,x,y,clr);
and AND2(s0,address,q);

endmodule//

//--Module Test--

module test;

reg x[3:0],address,rw,clk,clr;
wire s0[3:0],q,qnot;

ram1x1 r1(s0[0],q,qnot,address,rw,clk,x[0],clr);
ram1x1 r2(s0[1],q,qnot,address,rw,clk,x[1],clr);
ram1x1 r3(s0[2],q,qnot,address,rw,clk,x[2],clr);
ram1x1 r4(s0[3],q,qnot,address,rw,clk,x[3],clr);

//--Testar Valores

initial begin

$display(" Mateus Augusto Moraes Ferreira  Matricula: 435669");
$display("");
$display("  s0   s1   s2   s3   CLK  R/W  ADDRESS");

 clk   = 1;rw = 1;address = 1;x[0] = 1;x[1]= 1;x[2]= 1;x[3]= 1;
 #1$display("%4b %4b %4b %4b %4b %4b %4b",s0[0],s0[1],s0[2],s0[3],clk,rw,address);
clk   = 0;rw = 1;address = 1;x[0] = 1;x[1]= 1;x[2]= 1;x[3]= 1;
#1$display("%4b %4b %4b %4b %4b %4b %4b",s0[0],s0[1],s0[2],s0[3],clk,rw,address);
clk   = 0;rw = 0;address = 0;x[0] = 1;x[1]= 1;x[2]= 1;x[3]= 1;
#1$display("%4b %4b %4b %4b %4b %4b %4b",s0[0],s0[1],s0[2],s0[3],clk,rw,address); 
 clk   = 0;rw = 0;address = 1;x[0] = 1;x[1]= 1;x[2]= 1;x[3]= 1;
#1$display("%4b %4b %4b %4b %4b %4b %4b",s0[0],s0[1],s0[2],s0[3],clk,rw,address);

end 
endmodule //fim Exemplo0101