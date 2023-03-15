Table table;

void setup() {
  table = loadTable("data/flights2k.csv", "header");
  println(table.getRowCount() + " total rows in table");
  for (TableRow row : table.rows()) {
    int dist = row.getInt("DISTANCE");
    println(dist);
  }
}
