//-------------------------------
// EXTRA 01
// Luiz Marques de Oliveira
// 417130
//-------------------------------


module complemento1(output a,output b,output c,output d,output e,output f,output g,output h, input s,input s1,input s2,input s3,input s4,input s5,input s6, input s7);

endmodule



module testnandgate;
reg a,b,c,d,e,f,g,h;
wire s;

not NOT1(s,a);
not NOT2(s1,b);
not NOT3(s2,c);
not NOT4(s3,d);
not NOT5(s4,e);
not NOT6(s5,f);
not NOT7(s6,g);
not NOT8(s7,h);

initial begin:start
	a=0;b=0;c=0;d=0;e=0;f=0;g=0;h=0;
	
	
	end
	
	
	initial begin:main
	$display("Extra - Luiz Marques de Oliveira");
	$display("Complemento de 1");

	$monitor("   %b %b %b %b %b %b %b %b  = %b %b %b %b %b %b %b %b )", a,b,c,d,e,f,g,h,s,s1,s2,s3,s4,s5,s6,s7);
	
#1 a=1;b=0;c=0;d=0;e=0;f=0;g=0;h=1;
#1 a=1;b=1;c=1;d=1;e=0;f=0;g=0;h=0;
#1 a=1;b=1;c=1;d=1;e=1;f=1;g=1;h=1;
	end
	
	endmodule // test