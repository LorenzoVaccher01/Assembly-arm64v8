int a[5] = {1, 2, -3, -1, 5};

int remove_neg(int in[], int len) { 
  int i, ret = 0;

  for (i = 0; i < len; i++)
    if (in[i] < 0) {
      ret = ret + in[i];
      in[i] = 0;
   }

  return(ret);
}

int main() {
  int ret;
  ret = remove_neg(a, 5);
  return 0;
}