class Flights {
  ArrayList<Flight> flights = new ArrayList<Flight>();
  ArrayList<String> airports = new ArrayList<String>();
  Flights() {
    Table table = loadTable("data/flights_full.csv", "header");
    println(table.getRowCount() + " total rows in table");
    for (TableRow row : table.rows()) {
      boolean cancelled, diverted;
      if (row.getInt("CANCELLED") == 1) cancelled = true;
      else cancelled = false;
      if (row.getInt("DIVERTED") == 1) diverted = true;
      else diverted = false;
      tempFlight = new Flight(row.getString("FL_DATE"), row.getString("MKT_CARRIER"), row.getInt("MKT_CARRIER_FL_NUM"),
        row.getString("ORIGIN"), row.getString("ORIGIN_CITY_NAME"), row.getString("ORIGIN_STATE_ABR"),
        row.getInt("ORIGIN_WAC"), row.getString("DEST"), row.getString("DEST_CITY_NAME"),
        row.getString("DEST_STATE_ABR"), row.getInt("DEST_WAC"), row.getInt("CRS_DEP_TIME"),
        row.getInt("DEP_TIME"), row.getInt("CRS_ARR_TIME"), row.getInt("ARR_TIME"),
        cancelled, diverted, row.getInt("DISTANCE"));
      this.flights.add(tempFlight);
    }
    table = loadTable("data/airports.csv", "header");
    println(table.getRowCount() + " total airports in table");
    for (TableRow row : table.rows()) {
      String tempAirport = row.getString("ORIGIN_CITY_NAME");
      this.airports.add(tempAirport);
    }
    println("Done loading flights.");
  }

  int[] getDistances() {
    ArrayList<Flight> onTime = new ArrayList<Flight>();

    for (int i=0; i < flights.size(); i++) {
      if ((!flights.get(i).diverted) && (!flights.get(i).cancelled)) {
        onTime.add(flights.get(i));
      }
    }
    int[] distances = new int[onTime.size()];
    for (int i =0; i<onTime.size(); i++) {
      distances[i] = onTime.get(i).distance;
    }
    return distances;
  }
  int[] getTimes() {
    ArrayList<Flight> OnTime = new ArrayList<Flight>();

    for (int i=0; i < flights.size(); i++) {
      if ((!flights.get(i).diverted) && (!flights.get(i).cancelled)) {
        OnTime.add(flights.get(i));
      }
    }
    int[] times = new int[OnTime.size()];
    for (int i =0; i<OnTime.size(); i++) {
      Flight temp = OnTime.get(i);
      if (temp.actualDepartureTime <= temp.actualArrivalTime) {
        times[i] = temp.actualArrivalTime - temp.actualDepartureTime;
      } else {
        times[i] = (2400 - temp.actualDepartureTime) + temp.actualArrivalTime;
      }
    }
    return times;
  }
}
