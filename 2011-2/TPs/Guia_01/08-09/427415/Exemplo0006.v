//Exemplo0006
//Autor: Iago Braga
//Matricula: 427415

//NAND gate
       module nandgate
       assign s = ~(p & q);
       end module

//Test Nand gate
       module testNandGate

       //----Dados locais----
       reg a,b;
       wire s;

       //----Instancia-------
       nandgate NAND1(output s, input a, input b);


       //----Principal-------
       initial begin:main
       $display("Exemplo0006");
       $display("Teste NAND Gate");
       $display("\n~(a & b) = s\n");
       a=0; b=0;
       #1 $display("~(%b & %b) = %b",a,b,s)
       b=1;
       #1 $display("~(%b & %b) = %b",a,b,s)
       a=1; b=0;
       #1 $display("~(%b & %b) = %b",a,b,s)
       b=1;
       #1 $display("~(%b & %b) = %b",a,b,s)
       end

       end module