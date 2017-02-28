//------------------------------------
// Extra01
// Jorge Luis dos Santos Leal
// Matrícula: 417466
// 08/2011
//------------------------------------
module extra01(input a,input b,input c,input d,input e,input f,input g,input h,output s1,output s2,output s3,output s4,output s5,output s6,output s7,output s8);
endmodule

module testextra;
//----Definir dados
reg a,b,c,d,e,f,g,h;
wire s;

not NOT01(s1,a);
not NOT02(s2,b);
not NOT03(s3,c);
not NOT04(s4,d);
not NOT05(s5,e);
not NOT06(s6,f);
not NOT07(s7,g);
not NOT08(s8,h);


//----Parte principal

initial begin:start

a=0;b=0;c=0;d=0;e=0;f=0;g=0;h=0;

end

initial begin:main
$display("Extra01 - Jorge Luis dos Santos Leal");
$display("Matricula: 417466");
$display("Complemento de 1");
$monitor("%b %b %b %b %b %b %b %b = %b %b %b %b %b %b %b %b",a,b,c,d,e,f,g,h,s1,s2,s3,s4,s5,s6,s7,s8);

#1 a=0;b=0;c=1;d=0;e=1;f=0;g=1;h=0;
#1 a=1;b=0;c=1;d=0;e=1;f=0;g=1;h=0;
#1 a=1;b=1;c=1;d=0;e=0;f=0;g=0;h=0;
#1 a=1;b=1;c=1;d=1;e=1;f=1;g=1;h=1;
    
end
endmodule // Extra01


/*
TESTE
    Exercicio 03 - Jorge Luis dos Santos Leal
    Matricula: 417466
    Complemento de 2
    
    a) 100111(2) C2= 11001(2)
    
    b) 54(8) C2= 10100(2)
    
    c) 13(10) C2= 11(2)
    
    d) 1B(16) C2= 101(2)
    
    e) 25 - 36 C2= 1011(2)
	 */

