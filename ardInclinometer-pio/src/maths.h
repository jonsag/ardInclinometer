double round1dec(double b)
{
  if ((int)((b * 10 - (int)(b * 10)) * 10) >= 5)
  {
    return (double)(int)(b * 10) / 10 + 0.1;
  }
  else
  {
    return (double)(int)(b * 10) / 10;
  }
}

int lengthOfFloat(float value)
{
  char buffer[7];

  String tmpStr = dtostrf(value, 7, 2, buffer);

  tmpStr.trim();

  return tmpStr.length();
}
