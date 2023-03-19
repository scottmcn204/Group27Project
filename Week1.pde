
import org.gicentre.utils.stat.*;    // For chart classes.
 
final int SCREENX = 900;
final int SCREENY = 600;
Table table;
Flight tempFlight;
ArrayList<Flight> flights;
PFont myFont;
float textXpos = 0;
float textYpos = 0;
float arrivals[];
String dests[];

BarChart barChart;
void settings()
{
  size(SCREENX,SCREENY);
}
void setup() {
  background(180);
  myFont = createFont("Arial", 32);

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
  dests = new String[] {"ABQ","ADQ","ALB","ANC","ATL"};
  arrivals = new float[5];
  for (int i =0; i< flights.size(); i++){
    for (int j = 0; j < 5; j++){
      tempFlight = flights.get(i);
      if (tempFlight.DEST.equals(dests[j])){
        arrivals[j] += 1;
      }
    }
  }
  textFont(myFont,32); //<>//
  fill(255); 
  text("Dashboard", 25, 40);
  barChart = new BarChart(this);
  barChart.setData(arrivals);
     
  // Axis scaling
  barChart.setMinValue(0);
  barChart.setMaxValue(120);
     
  barChart.showValueAxis(true);
  barChart.showCategoryAxis(true);
  barChart.setBarLabels(dests);
}

void draw()
{
  background(255);
  barChart.draw(15,15,width-300,height-100); 
} //<>//
