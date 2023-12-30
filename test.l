%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int in[20];
float fl[20];
char key[20][20];
char rel_op[20][20];
char arith_op[20][20];
char assign_op[20][20];
char log_op[20][20];
char val_id[20][20];
char func_name[20][20];
char symbols[20][20];
char strings[200][200];

int i=0, k=0, l=0, m=0, n=0, o=0, p=0, q=0, r=0, s=0,t=0;

%}

%option noyywrap

keyword int|float|char|double|extern|return|if|else|then
rel_op "<="|">="|"=="|"!="|"<"|">"|"-"
ari_op "++"|"--"|[\+\-\*/\%]
asi_op "="|"+="|"-="
logi_op "&&"|"||"|"!"
symbol "{"|"}"|"["|"]"|","|";"|"("|")"
string \"([^\"]|\\.)*\"|\'([^\"]|\\.)*\'


%%


{rel_op} {strcpy(rel_op[k], yytext); k++;}
{ari_op} {strcpy(arith_op[n], yytext); n++;}
{asi_op} {strcpy(assign_op[o], yytext); o++;}
{logi_op} {strcpy(log_op[p], yytext); p++;}
{symbol} {strcpy(symbols[s], yytext); s++;}
{string} {strcpy(strings[t], yytext); t++;}

[-]?[0-9]+ {in[l]=atoi(yytext);l++;}
[-]?[0-9]*[.][0-9]+ {fl[m]=atof(yytext);m++;}
{keyword} {strcpy(key[i], yytext); i++;}  // Move this rule before the rule for function names
[a-zA-Z_][a-zA-Z0-9_]* {strcpy(val_id[q], yytext); q++;}
[a-zA-Z_][a-zA-Z0-9_]*\(.*\) {strcpy(func_name[r], yytext); r++;}


%%

int main( )
{
    FILE *fp = fopen("input.txt", "r");
    yyin = fp;
    yylex();

    FILE *fp_out = fopen("output1.txt", "w");
    yyout = fp_out;
    yylex();


    printf("Keyword:\n");
    fprintf(fp_out, "Keyword:\n");    
    
    printf("=> ");
    fprintf(fp_out, "=> ");
    
    for(int j=0;j<i;j++){
        printf("%s, ",key[j]);
        fprintf(fp_out,"%s, ",key[j]);
    }
    printf("\n\n");
    fprintf(fp_out, "\n\n");


    printf("Relational Operator:\n");
    fprintf(fp_out, "Relational Operator:\n"); 

    printf("=> ");
    fprintf(fp_out, "=> ");

    for(int j=0;j<k;j++){
        printf("%s, ",rel_op[j]);
        fprintf(fp_out,"%s, ",rel_op[j]);
    }
    
    printf("\n\n");
    fprintf(fp_out, "\n\n");

   
    printf("Arithmetic Operator:\n");
    fprintf(fp_out, "Arithmetic Operator:\n"); 

    printf("=> ");
    fprintf(fp_out, "=> ");

    for(int j=0;j<n;j++){
        printf("%s, ",arith_op[j]);
        fprintf(fp_out,"%s, ",arith_op[j]);
    }
    
    printf("\n\n");
    fprintf(fp_out, "\n\n");
   
    printf("Assignment Operator:\n");
    fprintf(fp_out, "Assignment Operator:\n"); 

    printf("=> ");
    fprintf(fp_out, "=> ");

    for(int j=0;j<o;j++){
        printf("%s, ",assign_op[j]);
        fprintf(fp_out,"%s, ",assign_op[j]);
    }
    
    printf("\n\n");
    fprintf(fp_out, "\n\n");
   
    printf("Logical Operator:\n");
    fprintf(fp_out, "Logical Operator:\n"); 

    printf("=> ");
    fprintf(fp_out, "=> ");

    for(int j=0;j<p;j++){
        printf("%s, ",log_op[j]);
        fprintf(fp_out,"%s, ",log_op[j]);
    }
    
    printf("\n\n");
    fprintf(fp_out, "\n\n");
 

    printf("Valid Integers:\n");
    fprintf(fp_out, "Valid Integers:\n"); 

    printf("=> ");
    fprintf(fp_out, "=> ");

    for(int j=0;j<l;j++){
        printf("%d, ",in[j]);
        fprintf(fp_out,"%d, ",in[j]);
    }
    
    printf("\n\n");
    fprintf(fp_out, "\n\n");

    printf("Valid Floating Num:\n");
    fprintf(fp_out, "Valid Floating Num:\n"); 

    printf("=> ");
    fprintf(fp_out, "=> ");

    for(int j=0;j<m;j++){
        printf("%f, ",fl[j]);
        fprintf(fp_out,"%f, ",fl[j]);
    }
    printf("\n\n");
    fprintf(fp_out, "\n\n");

    printf("Valid Identifiers:\n");
    fprintf(fp_out, "Valid Identifiers:\n"); 

    printf("=> ");
    fprintf(fp_out, "=> ");

    for(int j=0;j<q;j++){
        printf("%s, ",val_id[j]);
        fprintf(fp_out,"%s, ",val_id[j]);
    }
    printf("\n\n");
    fprintf(fp_out, "\n\n");
    
    printf("Function Names:\n");
    fprintf(fp_out, "Function Names:\n"); 

    printf("=> ");
    fprintf(fp_out, "=> ");

    for(int j=0;j<r;j++){
        printf("%s, ", func_name[j]);
        fprintf(fp_out,"%s, ",func_name[j]);
    }
    printf("\n\n");
    fprintf(fp_out, "\n\n");
    
    printf("Other Symbols:\n");
    fprintf(fp_out, "Other Symbols:\n"); 

    printf("=> ");
    fprintf(fp_out, "=> ");

    for(int j=0;j<s;j++){
        printf("%s, ", symbols[j]);
        fprintf(fp_out,"%s, ",symbols[j]);
    }
    printf("\n\n");
    fprintf(fp_out, "\n\n");
    
    printf("Strings:\n"); 
    fprintf(fp_out, "Strings:\n");

    printf("=> ");
    fprintf(fp_out, "=> ");

    for(int j=0;j<t;j++){
        printf("%s, ", strings[j]);
        fprintf(fp_out, "%s, ",strings[j]);
    }
    
    printf("\n\n");
    fprintf(fp_out, "\n\n");

    return 0;
}