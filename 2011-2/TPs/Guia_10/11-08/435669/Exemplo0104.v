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
04.) Projetar e descrever em Verilog e Logisim um módulo 
para implementar uma memória RAM 1x8 
(1 endereço para 8 bits) 
usando flip-flops do tipo JK como registradores de dados. 
--------------------------------------------------------
*/
//---------------------
//--  FLIP FLOOP JK  --
//---------------------

module jkff ( output q, output qnot,
              input j, input k, input clk,input clear );

reg q, qnot;

initial begin
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

//--Execucao--
module test;

reg address,rw,clk,x[7:0],clr;
wire y,k,p,c,v,a,r,t,z,q[7:0],qnot,s0[7:0];

and AND1(y,address,rw,clk);//entra no clk do flip flop
and AND2(k,q[0],address);
and AND3(p,q[1],address);
and AND4(c,q[2],address);
and AND5(v,q[3],address);
and AND6(a,q[4],address);
and AND7(r,q[5],address);
and AND8(t,q[6],address);
and AND9(z,q[7],address);

jkff jk1(q[0],qnot,x[0],x[0],y,clr);
jkff jk2(q[1],qnot,x[1],x[1],y,clr);
jkff jk3(q[2],qnot,x[2],x[2],y,clr);
jkff jk4(q[3],qnot,x[3],x[3],y,clr);
jkff jk5(q[4],qnot,x[4],x[4],y,clr);
jkff jk6(q[5],qnot,x[5],x[5],y,clr);
jkff jk7(q[6],qnot,x[6],x[6],y,clr);
jkff jk8(q[7],qnot,x[7],x[7],y,clr);



initial begin

$display("Mateus Augusto Moraes Ferreira  Matricula: 435669");
$display("");
$display("s0   s1   s2   s3    s4    s5    s6    s7   CLK  R/W  ADDSS");
 clk   = 1;rw = 1;address = 1;x[0] = 1;x[1]= 1;x[2]= 1;x[3]= 1;x[4] = 1;x[5]= 1;x[6]= 1;x[7]= 1;
  #1$display("%4b %4b %4b %4b %4b %4b %4b %4b %4b %4b %4b",k,p,c,v,a,r,t,z,clk,rw,address);
clk   = 0;rw = 1;address = 1;x[0] = 1;x[1]= 1;x[2]= 1;x[3]= 1;x[4] = 1;x[5]= 1;x[6]= 1;x[7]= 1;
#1$display("%4b %4b %4b %4b %4b %4b %4b %4b %4b %4b %4b",k,p,c,v,a,r,t,z,clk,rw,address);
clk   = 0;rw = 0;address = 0;x[0] = 1;x[1]= 1;x[2]= 1;x[3]= 1;x[4] = 1;x[5]= 1;x[6]= 1;x[7]= 1;
#1$display("%4b %4b %4b %4b %4b %4b %4b %4b %4b %4b %4b",k,p,c,v,a,r,t,z,clk,rw,address); 
 clk   = 0;rw = 0;address = 1;x[0] = 1;x[1]= 1;x[2]= 1;x[3]= 1;x[4] = 1;x[5]= 1;x[6]= 1;x[7]= 1;
#1$display("%4b %4b %4b %4b %4b %4b %4b %4b %4b %4b %4b",k,p,c,v,a,r,t,z,clk,rw,address);


end 

endmodule//Exemplo0104