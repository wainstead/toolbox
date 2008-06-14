%{
#include <studio.h>
%}

%token NOUN PRONOUN VERB ADVERB ADJECTIVE PREPOSITION CONJUNCTION

%%

sentence: subject VERB object { printf("Sentence is valid.\n"); }
;

subject: NOUN | PRONOUN ;
object:  NOUN;
%%

extern FILE *yyin;

main()
{
  do {
    yyparse();
  } while ( ! feof(yyin));
}  

yyerror(s)
{
  fprintf(stderr, "%s\n", s);
}

