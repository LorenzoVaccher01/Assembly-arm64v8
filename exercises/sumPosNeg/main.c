void sum_pos_neg(int *v, int n, int *sum_pos, int *sum_neg) {
  int i;
  int sump, sumn;

  if (n == 0) 
    return;

  sump = 0;
  sumn = 0;

  for (i = 0; i < n; i++) {
    if (*v > 0)
      sump += *v;
    
    if (*v < 0)
     sumn += *v;

    v = v+1;
  }

  *sum_pos = sump;
  *sum_neg = sumn;
}