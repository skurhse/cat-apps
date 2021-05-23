#include <execinfo.h>
#include <stdio.h>
#include <stdlib.h>

// Obtain a backtrace and print it to stdout

void
print_trace (void)
{
  void *array[10];
  char **strings;
  int size, i;

  size = backtrace (array, 10);
  strings = backtrace_symbols (array, size);
  if (strings != NULL)
  {

    printf ("Obtained %d stack frames.\n", size);
    for (i = 0; i < size; i++)
      printf ("%s\n", strings[i]);
  }

  free (strings);
}

int
main (void)
{
  print_trace ();
  return 0;
}
