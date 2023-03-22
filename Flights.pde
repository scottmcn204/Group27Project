class Flights {
  ArrayList<Flight> flights = new ArrayList<Flight>();
  Flights() {
    table = loadTable("data/flights_full.csv", "header");
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
      this.flights.add(tempFlight);
    }
    println("Done loading flights.");
  }
}
