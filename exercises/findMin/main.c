void find_min(int *v, int n, int *min) {
  int i, m;

  m = *v;
  v = v+1;

  for (i = 1; i < n; i++) {
    if (*v < m)
      m = *v;
    v = v+1;
  }
  
  *min = m;
}