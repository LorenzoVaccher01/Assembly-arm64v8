int sum_mul(int *v, int size) {
  int i, sum = 0;
  for (i = 0; i < size; i++) {
    if (v[i] % 4 == 0)
      sum += v[i];
  }

  return sum;
}