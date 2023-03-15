
String[] strings;
void setup() {
  strings = loadStrings("data/flights2k.csv");
  println(strings.length);
  for (int i = 0 ; i < strings.length; i++) {
    println(strings[i]);
  }
  //println(table.rows());
  //for (TableRow row : table.rows()) {
  //  String dist = row.getString("DISTANCE");
  //  println(dist);
  //}

}
