#include <stdio.h>

void genblack(FILE* fptr){
  // Warrior header
  fprintf(fptr, ";redcode-94\n");
  fprintf(fptr, ";name Bad Apple Black\n");
  fprintf(fptr, ";author ppygrlmel\n");
  fprintf(fptr, ";assert 1\n"); //Shut up warning on warrior compilation by pmars

  //TODO: Strategy
  fprintf(fptr, ";strategy TODO\n");
}

void genwhite(FILE* fptr){
  // Warrior header
  fprintf(fptr, ";redcode-94\n");
  fprintf(fptr, ";name Bad Apple White\n");
  fprintf(fptr, ";author ppygrlmel\n");
  fprintf(fptr, ";assert 1\n"); //Shut up warning on warrior compilation by pmars

  //TODO: Strategy
  fprintf(fptr, ";strategy TODO\n");
}

int main(){
  FILE* bfptr = fopen("genblack.red", "w");
  FILE* wfptr = fopen("genwhite.red", "w");

  if(!bfptr){ fprintf(stderr, "Failed to open file genblack.red\n"); }
  if(!wfptr){ fprintf(stderr, "Failed to open file genwhite.red\n"); }

  genblack(bfptr);
  genwhite(wfptr);

  fclose(bfptr);
  fclose(wfptr);

  return 0;
}
