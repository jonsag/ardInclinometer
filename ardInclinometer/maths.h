double round1dec(double b) {
    if ((int) ((b * 10 - (int) (b * 10)) * 10) >= 5) {
    return (double) (int) (b * 10) / 10 + 0.1;
  } else {
    return (double) (int) (b * 10) / 10;
  }

}
