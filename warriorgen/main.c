#include <stdio.h>

void wheader(FILE* fptr, const char* name){
  // Warrior header
  fprintf(fptr, ";redcode-94\n");
  fprintf(fptr, ";name Bad Apple %s\n", name);
  fprintf(fptr, ";author ppygrlmel\n");
  fprintf(fptr, ";assert 1\n"); //Shut up warning on warrior compilation by pmars
  
  //TODO: Strategy
  fprintf(fptr, ";strategy TODO\n");

  fprintf(fptr, "jmp  0\n");
}

void genblack(FILE* fptr){
  wheader(fptr, "Black");
}

void genwhite(FILE* fptr){
  wheader(fptr, "White");

  // Strategy
  fprintf(fptr, ";strategy Waits to get hijacked by black by idling after two\n");
  fprintf(fptr, ";strategy identifier DATs.\n");
  fprintf(fptr, ";strategy Serves as secondary color to generated image\n");

  fprintf(fptr,
      "   org  entry\n"
      "IDENTA dat #112, #112\n" //'p', 'p'
      "IDENTB dat #103, #109\n" //'g', 'm'
      "entry\n"
      "   jmp 0\n"
      "   end\n"
      );
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
