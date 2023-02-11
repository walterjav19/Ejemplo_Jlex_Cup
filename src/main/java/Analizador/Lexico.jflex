/*package e importaciones*/
package Analizador;
import java_cup.runtime.Symbol;

%%

%{
    //Codigo de usuario en sintaxis java
    //Agregar clases variables arreglos tc
%}


//directivas
%class Lexico
%public
%cup
%char
%column
%full
%line
%unicode

%init{
    yyline=1;
    yychar=0;
%init}


//Expresiones Regulares
BLANCOS=[ \r\t]+
D=[0-9]+
DD=[0-9]+("."[  |0-9]+)?

LineTerminator= \r|\n|\r\n
InputCharacter=[^\r\n]

comentariosimple="//" {InputCharacter}* {LineTerminator}?

%%

/*Reglas Semanticas*/

"Calcular" {return new Symbol(sym.REVALUAR,yyline,yychar,
                             yytext());} 

";" {return new Symbol(sym.PTCOMA,yyline,yychar, yytext());} 
"(" {return new Symbol(sym.PARIZQ,yyline,yychar, yytext());} 
")" {return new Symbol(sym.PARDER,yyline,yychar, yytext());} 
"[" {return new Symbol(sym.CORIZQ,yyline,yychar, yytext());} 
"]" {return new Symbol(sym.CORDER,yyline,yychar, yytext());} 

"+" {return new Symbol(sym.MAS,yyline,yychar, yytext());} 
"-" {return new Symbol(sym.MENOS,yyline,yychar, yytext());} 
"*" {return new Symbol(sym.POR,yyline,yychar, yytext());} 
"/" {return new Symbol(sym.DIVIDIDO,yyline,yychar, yytext());} 

\n {yychar=0;}

{BLANCOS} {} 
{D} {return new Symbol(sym.ENTERO,yyline,yychar, yytext());} 
{DD} {return new Symbol(sym.DECIMAL,yyline,yychar, yytext());} 

. {
    System.out.println("Este es un error lexico: "+yytext()+
    ", en la linea: "+yyline+", en la columna: "+yychar);
}



