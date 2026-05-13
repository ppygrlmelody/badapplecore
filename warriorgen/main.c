#include <stdio.h>

void genblack(FILE* fin, FILE* fout){
  char c = 69;

  while(c != EOF){
    c = getc(fin);
    putc(c, fout);
  }
}

void genwhite(FILE* fin, FILE* fout){
  char c = 69;

  while(c != EOF){
    c = getc(fin);
    putc(c, fout);
  }
}

int main(){
  FILE* binfptr = fopen("blackin.red", "r");
  FILE* winfptr = fopen("whitein.red", "r");

  FILE* boutfptr = fopen("blackout.red", "w");
  FILE* woutfptr = fopen("whiteout.red", "w");

  if(!binfptr){ fprintf(stderr, "Failed to open file blackin.red\n"); }
  if(!winfptr){ fprintf(stderr, "Failed to open file whitein.red\n"); }
  if(!boutfptr){ fprintf(stderr, "Failed to open file blackout.red\n"); }
  if(!woutfptr){ fprintf(stderr, "Failed to open file whiteout.red\n"); }

  genblack(binfptr, boutfptr);
  genwhite(winfptr, woutfptr);

  fclose(binfptr);
  fclose(winfptr);
  fclose(boutfptr);
  fclose(woutfptr);

  return 0;
}
