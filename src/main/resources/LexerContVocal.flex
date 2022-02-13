/*primer seccion: codigo de usuario*/
package com.compiladores1.countvocaljflex.analizador;
import java.util.ArrayList;
%%

 /*segunda seccion: configuracion*/

%class CounterLexer
%unicode
%line
%column
%public
%int

Vocal = [a|A|e|E|i|I|o|O|U|u]
L = [b-dB-Df-hF-Hj-nJ-Np-tP-Tv-zV-Z]
Simbolo = "*"|"+"|"-"|"/"|"#"|"."
Espacio = " "
SaltoDeLinea = \n|\r|\r\n
Noper = ({SaltoDeLinea}|{Espacio})
Numero = [0-9]+

%{
    private TokenPos token = null;
    private int countVocales = 0;
    private int contador1=0;
    private int contador2=0;
    private int contador3=0;
    private int contador4=0;
    private int contador5=0;
    private int contadorMayor=0;
    private ArrayList<TokenPos> tokensEnteros = new ArrayList<>();

    private void incrementContVocales() {
        countVocales++;
    }
    
    public int getCountVocales() {
        return countVocales;
    }

    private void setCountVocles(){
        aumentoContadores();
        this.countVocales = 0;
    }

    public void aumentoContadores(){
        if(this.countVocales > 0){
            switch(this.countVocales){
            case 1:
                this.contador1++;
                break;
            case 2:
                this.contador2++;
                break;
            case 3:
                this.contador3++;
                break;
            case 4:
                this.contador4++;
                break;
            case 5:
                this.contador5++;
                break;
            default:
                this.contadorMayor++;
                break;
            }
        }
        
    }

    public int getContador1() {
        return contador1;
    }

    public int getContador2() {
        return contador2;
    }

    public int getContador3() {
        return contador3;
    }

    public int getContador4() {
        return contador4;
    }

    public int getContador5() {
        return contador5;
    }

    public int getContadorMayor() {
        return contadorMayor;
    }

     public ArrayList<TokenPos> getTokensEnteros() {
        return tokensEnteros;
    }

    
%}


%eof{
    setCountVocles();
%eof}

%%


/*tercer seccion: reglase lexicas*/

    {Vocal}  {incrementContVocales();} 
    {L}   {/*ignoramos*/ }
    {Simbolo} {/*ignoramos*/ }
    {Noper} {setCountVocles();}
    {Numero} {setCountVocles();
    this.token = new TokenPos(yycolumn+1,yyline+1, yytext());
    this.tokensEnteros.add(token);
    }


[^] {setCountVocles();}

