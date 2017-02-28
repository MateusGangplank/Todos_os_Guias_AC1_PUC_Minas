// ------------------------- 
// ExercicioExtra2 - OR
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 
// ------------------------- 


// ------------------------- 
// -- or gate 
// ------------------------- 
	module orgate ( output s, input p, input q, input r, input t, input u, input v, input w, input x); 
	
	or or1(s,p,q,r,t,u,v,w,x);
	
	endmodule // orgate 

// --------------------- 
// -- test or gate 
// --------------------- 
	module testorgate; 

// ------------------------- dados locais 
	reg  a,b,c,d,e,f,g,h; // definir registradores 
	wire s; // definir conexao (fio) 

// ------------------------- instancia 
	orgate OR1 (s, a, b, c, d, e, f, g, h); 

// ------------------------- preparacao 
	initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
	a=0;b=0;c=0;d=0;e=0;f=0;g=0;h=0; 
end 

// ------------------------- parte principal 
	initial begin 
	$display("ExercicioExtra2 - Rodrigo Arruda de Assis - 427460"); 
	$display("Test OR gate"); 
	 
	a=1;b=0;c=0;d=0;e=0;f=0;g=0;h=0; 
	 #1 $display("%b  %b  %b  %b  %b  %b  %b  %b = %b", a, b, c, d, e, f, g, h, s); 
		
		 
end 
endmodule // testorgate 