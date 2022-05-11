int a[5] = {1,2,3,4,5};
int b[5];

int double_vect(int out[], int in[], int len) {
  int i, ret = 0;

  for (i=0; i < len; i++) {
    out[i] = in[i] * 2;
    ret += out[i];
  }

  return(ret);
}

int main() {
  int ret;
  ret = double_vect(b, a, 5);
}