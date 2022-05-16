int strncpy(char *dest, char *source, int n) {
 int i, last;

 i = 0;

 do {
  last = *source;
  *dest = last;
  
  source++;
  dest++;
  i++;

  if (i == n)
    break;
 } while (last != 0);

 return i;
}