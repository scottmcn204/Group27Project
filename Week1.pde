Table table;
Flight tempFlight;
ArrayList<Flight> flights;
void setup() {
  
  flights = new ArrayList<Flight>();
  table = loadTable("data/flights2k.csv", "header");
  println(table.getRowCount() + " total rows in table");
  
  for (TableRow row : table.rows()) {
    
    boolean cancelled, diverted;
    if (row.getInt("CANCELLED") == 1) cancelled = true;
    else cancelled = false;
    if (row.getInt("DIVERTED") == 1) diverted = true;
    else diverted = false;
    
    tempFlight = new Flight(row.getString("MKT_CARRIER"), row.getInt("MKT_CARRIER_FL_NUM"), 
    row.getString("ORIGIN"), row.getString("ORIGIN_CITY_NAME"), row.getString("ORIGIN_STATE_ABR"),
    row.getInt("ORIGIN_WAC"), row.getString("DEST"), row.getString("DEST_CITY_NAME"),
    row.getString("DEST_STATE_ABR"), row.getInt("DEST_WAC"), row.getInt("CRS_DEP_TIME"), 
    row.getInt("DEP_TIME"), row.getInt("CRS_ARR_TIME"), row.getInt("ARR_TIME"), 
    cancelled, diverted, row.getInt("DISTANCE"));
    
    flights.add(tempFlight);
  }
  println("Done loading flights."); //<>//
  //Selecting a flight at random to match data, ensuring it has been loaded correctly.
  int r = (int)random(2000);
  tempFlight = flights.get(r);
  println("Selecting a random flight: " + tempFlight.ORIGIN + " to " + 
    tempFlight.DEST + ", distance " + tempFlight.DISTANCE + ".");
}
