package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%
int {return new Symbol(sym.Int, yychar, yyline, yytext());}
if {return new Symbol(sym.If, yychar, yyline, yytext());}
else {return new Symbol(sym.Else, yychar, yyline, yytext());}
while {return new Symbol(sym.While, yychar, yyline, yytext());}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return new Symbol(sym.Igual, yychar, yyline, yytext());}
"+" {return new Symbol(sym.Suma, yychar, yyline, yytext());}
"-" {return new Symbol(sym.Resta, yychar, yyline, yytext());}
"*" {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}
"/" {return new Symbol(sym.Division, yychar, yyline, yytext());}
"(" {return new Symbol(sym.Parenthesis_a, yychar, yyline, yytext());}
")" {return new Symbol(sym.Parenthesis_c, yychar, yyline, yytext());}
"{" {return new Symbol(sym.Llave_a, yychar, yyline, yytext());}
"}" {return new Symbol(sym.Llave_c, yychar, yyline, yytext());}
"main" {return new Symbol(sym.Main, yychar, yyline, yytext());}
";" {return new Symbol(sym.P_coma, yychar, yyline, yytext());}
{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());}
 . {return new Symbol(sym.Error, yychar, yyline, yytext());}