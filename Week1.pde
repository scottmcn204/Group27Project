import grafica.*;

final int SCREENX = 900;
final int SCREENY = 600;
Table table;
Flight tempFlight;
ArrayList<Flight> flights;
PFont myFont;
float textXpos = 0;
float textYpos = 0;
GPlot testPlot;

void settings()
{
  size(SCREENX,SCREENY);
}
void setup() {
  background(180);
  myFont = createFont("Arial", 32);
  
  testPlot = new GPlot(this, 25, 150);
  testPlot.setTitleText("Flight Distances");
  GPointsArray dists = new GPointsArray(5);
  
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
  
  textFont(myFont,32);
  fill(255); 
  text("Dashboard", 25, 40);
  
  for (int i = 0; i < 5; i++) {
    tempFlight = flights.get(i);
    PVector testVector = new PVector((float)tempFlight.DEPT_TIME, (float)tempFlight.ARR_TIME);
    dists.add(testVector, tempFlight.MKT_CARRIER);
  }
  testPlot.getYAxis().getAxisLabel().setText("Distance");
  testPlot.getXAxis().getAxisLabel().setText("Airline");
  testPlot.setPoints(dists);
  testPlot.startHistograms(GPlot.VERTICAL);
  
/*
    for (int i = 0; i < (flights.size()); i++){ //<>//
    tempFlight = flights.get(i);
      if (textYpos >=  (SCREENY-20)){
      textXpos += 130;
      textYpos = 0;
      
    }
    text(tempFlight.ORIGIN + " to " + 
    tempFlight.DEST + ", distance " + tempFlight.DISTANCE + ".", textXpos, textYpos);
    textYpos += 10;
    
    
    
    
    println(tempFlight.ORIGIN + " to " + 
    tempFlight.DEST + ", distance " + tempFlight.DISTANCE + ".");
*/
}

void draw() {
    testPlot.beginDraw();
    testPlot.drawBox();
    testPlot.drawYAxis();
    testPlot.drawTitle();
    testPlot.drawHistograms();
    testPlot.endDraw();
}
