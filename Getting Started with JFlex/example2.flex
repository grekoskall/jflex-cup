%%
%class search
%standalone
%line
%column
%%
(a|b)*abb {System.out.printf(
  "*** found match *%s+ at line %d, column %d\n",
  yytext(), yyline+1, yycolumn);
  }
\n {}
. {}
