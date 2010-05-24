#include <stdio.h> // from l'oreal

#define _STATEMENT(STMT) do STMT while (0)

/*
#define _CONNECT_OPTION_LIST_SINGLE(NAME, LIST,			\
				    TYPE_FOO, VFOO_MEMBER,	\
				    GETVALUE, SETVALUE)		\
    {								\
	Var pair = new_list(2);					\
	pair.v.list[1].type = TYPE_STR;				\
	pair.v.list[1].v.str = str_dup(#NAME);			\
	pair.v.list[2].type = (TYPE_FOO);			\
	pair.v.list[2].v.VFOO_MEMBER = (GETVALUE);		\
	LIST = listappend(LIST, pair);				\
    }								\


#define CONNECTION_OPTION_LIST(TABLE,HANDLE,LIST)	\
    _STATEMENT({					\
	TABLE(_CONNECT_OPTION_LIST_SINGLE, (HANDLE), @,	\
	      (LIST))					\
	return (LIST);					\
    })




void foo() {
  CONNECTION_OPTION_LIST(NETWORK_CO_TABLE, nh, list);
}
*/


#define CONNECTION_OPTION_LIST(TABLE,HANDLE,LIST)	\
    _STATEMENT({					\
	TABLE(_CONNECT_OPTION_LIST_SINGLE, (HANDLE), @,	\
	      (LIST))					\
	return (LIST);					\
    })


int main() {

  char *foo = "CONNECTION_OPTION_LIST(NETWORK_CO_TABLE, nh, list);";
    printf("Hello, sailor! %s\n", foo);
  return(0);
}
