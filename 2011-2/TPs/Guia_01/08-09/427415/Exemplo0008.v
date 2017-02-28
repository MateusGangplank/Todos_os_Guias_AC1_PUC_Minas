//Exemplo0007
//Autor: Iago Braga
//Matricula: 427415

//XNOR gate
       module xnorgate
       assign s = ~(p ^ q);
       end module

//Teste Xnor gate
       module testXnorGate

       //----Dados locais----
       reg a,b;
       wire s;

       //----Instancia-------
       xnorgate XNOR1(output s, input a, input b);

       //----Preparacao------
       initial begin:start
       a=0;
       b=0;
       end
       
       //----Principal-------
       initial begin:main
       $display("Exemplo0008");
       $display("Teste XNOR Gate");
       $display("\n~(a ^ b) = s\n");
       $monitor("~(%b ^ %b) = %b", a, b, s);
       #1 a=0; b=1;
       #1 a=1; b=0;
       #1 a=1; b=1;
       end

       end module