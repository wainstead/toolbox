#include <stdio.h>

#define NP_LOCAL 0
#define NP_TCP   1
#define NETWORK_PROTOCOL NP_TCP

#if NETWORK_PROTOCOL == NP_LOCAL
#    define FOO "local"
#elif NETWORK_PROTOCOL == NP_TCP
#    define FOO "tcp"
#endif

int main() {
  printf("Hello, sailor! (%d, %s)\n", NETWORK_PROTOCOL, FOO);
}
