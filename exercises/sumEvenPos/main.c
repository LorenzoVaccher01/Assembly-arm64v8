int ar[10] = {1,-1,2,-2,4,-4,5,-5,6,-6};

int sum_even_pos(int a[], int n) {
  int i, acc;
  acc = 0;

  for (i=0; i<n; i += 2)
    acc += a[i];

  return acc;
}

int main() {
  int ret;
  ret = sum_even_pos(ar, 10);
  printf("%d", ret);
}