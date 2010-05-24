#include <stdio.h>

enum Var {
  FALSE,
  TRUE,
  ERROR
};

//Var var_type;

int testcode(Var);


int main() {
  int retcode = 0;

  retcode = printf("Hello, sailor!\n");
  testcode((Var)retcode);

}

int testcode(Var retcode) {
  switch (retcode) {
  case FALSE: 
    printf("false\n"); 
    break;
  case TRUE: 
    printf("true\n");   
    break;
  case ERROR: 
    printf("error\n"); 
    break;
  default: printf("Invalid return code: %d\n", retcode);
  }
  return 0;
}
