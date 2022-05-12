int ar[10] = {1,10,2,10,4,10,5,-5,10,10};
int size = 10;
int number = 10;

/**
* Funzione che conta il numero di occorrenze in un determinato array.
*/
int countNumber(int a[], int n, int number) {
  int i, occ = 0;

  for (i = 0; i < n; i += 2)
    if (a[i] == number)
      ++occ;

  return occ;
}

int main() {
  int ret;
  ret = countNumber(ar, size, number);
}