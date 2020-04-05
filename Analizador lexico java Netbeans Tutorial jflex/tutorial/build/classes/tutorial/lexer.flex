package tutorial;

import java.io.*;
import static tutorial.tokens.*;

%%

%class lexer
%type tokens
%line
%column

D=[0-9]
L=[a-zA-Z_]
CA="\""[^*]~"\"" | "\"" + "\""
WHITE=[ \t\r\n]

%{
    public String lexeme;
    InformationCodigo c=new InformationCodigo();
%}

%%

{WHITE} {}
<YYINITIAL> "+" {c.linea=yyline ; lexeme=yytext() ; return MAS;}
<YYINITIAL> "==" {c.linea=yyline ; lexeme=yytext() ; return IGUAL;}
<YYINITIAL> "-" {c.linea=yyline ; lexeme=yytext() ; return MENOS;}
<YYINITIAL> "!=" {c.linea=yyline ; lexeme=yytext() ; return DISTINTO;}
<YYINITIAL> "||" {c.linea=yyline ; lexeme=yytext() ; return OR;}
<YYINITIAL> "&&" {c.linea=yyline ; lexeme=yytext() ; return AND;}
<YYINITIAL> "{" {c.linea=yyline ; lexeme=yytext() ; return DELIMITADOR;}
<YYINITIAL> "}" {c.linea=yyline ; lexeme=yytext() ; return DELIMITADOR;}
<YYINITIAL> "(" {c.linea=yyline ; lexeme=yytext() ; return DELIMITADOR;}
<YYINITIAL> ")" {c.linea=yyline ; lexeme=yytext() ; return DELIMITADOR;}
<YYINITIAL> "=" {c.linea=yyline ; lexeme=yytext() ; return ASIGNACION;}
<YYINITIAL> "/" {c.linea=yyline ; lexeme=yytext() ; return ENTRE;}
<YYINITIAL> "%" {c.linea=yyline ; lexeme=yytext() ; return MODULO;}
<YYINITIAL> "<" {c.linea=yyline ; lexeme=yytext() ; return MENOR;}
<YYINITIAL> ">" {c.linea=yyline ; lexeme=yytext() ; return MAYOR;}
<YYINITIAL> ";" {c.linea=yyline ; lexeme=yytext() ; return PUNTO_Y_COMMA;}
<YYINITIAL> "main" {c.linea=yyline ; lexeme=yytext() ; return RESERVADA;}
<YYINITIAL> "if" {c.linea=yyline ; lexeme=yytext() ; return RESERVADA;}
<YYINITIAL> "while" {c.linea=yyline ; lexeme=yytext() ; return RESERVADA;}
<YYINITIAL> "else" {c.linea=yyline ; lexeme=yytext() ; return RESERVADA;}
<YYINITIAL> "putw" {c.linea=yyline ; lexeme=yytext() ; return RESERVADA;}
<YYINITIAL> "int" {c.linea=yyline ; lexeme=yytext() ; return RESERVADA;}
<YYINITIAL> "break" {c.linea=yyline ; lexeme=yytext() ; return RESERVADA;}
<YYINITIAL> "puts" {c.linea=yyline ; lexeme=yytext() ; return RESERVADA;}
<YYINITIAL> {D}+ {c.linea=yyline ; lexeme=yytext() ; return CANTIDAD;}
<YYINITIAL> {L}({L}|{D})* {c.linea=yyline ; lexeme=yytext() ; return ID;}
<YYINITIAL> {CA}+ {c.linea=yyline ; lexeme=yytext() ; return CADENA;}
<YYINITIAL> "*" {c.linea=yyline ; lexeme=yytext() ; return POR;}
. {c.linea=yyline ; lexeme=yytext() ; return ERROR;}