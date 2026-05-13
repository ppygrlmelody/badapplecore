#include <stdio.h>

const int SCREEN_WIDTH = 7;
const int SCREEN_HEIGHT = 3;
const int PADDING = 99;

const char* img = {
  "xxoooxx"
  "xxxoxxx"
  "ooxxxoo"
};

void genimg(FILE* fptr){
  char* c = img;
  int x = 0;
  int y = 0;

  while(*c){
    if(*c=='x'){
      fprintf(fptr, "spl (SCREEN_WIDTH+PADDING)*%i+LAST+%i\n", y, x);
    }

    ++c;
    ++x;
    if(x>=SCREEN_WIDTH){
      x-=SCREEN_WIDTH;
      ++y;
    }
  }
}

int main(){
  FILE* fptr = fopen("data.red", "w");

  if(!fptr){
    fprintf(stderr, "Could not open file data.red\n");
    return 1;
  }

  fprintf(fptr,
      "; Paste this to the payload section of the redcode warrior\n"
      "; that will contain the payload\n"
      );

  genimg(fptr);

  fclose(fptr);

  return 0;
}
