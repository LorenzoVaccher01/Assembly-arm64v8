int copy(char a[], char b[]) {
  int i = 0;
  
  while (b[i] != 0) {
    a[i] = b[i];
    i++;
  }

  a[i] = 0;
  return i;
}