import org.gicentre.utils.stat.*;   
import controlP5.*;
/**
* The PieChart Class is used to implement the pie chart found
*   on the dashboard page of the program.
* Using controlP5's Chart
*/
class PieChart{
  
  Chart pieChart;
  
  PieChart(float[] data, int xPos, int yPos){
    pieChart = cp5.addChart("pie")
                    .setPosition(xPos, yPos)
                    .setSize(300, 300)
                    .setRange(0, 1000)
                    .setView(Chart.PIE)
                    .setCaptionLabel("DIVERTED");
                    
    pieChart.getColor().setBackground(color(255, 100));
    pieChart.addDataSet("flights");
    pieChart.setColors("flights", color(0, 45, 90), color(255, 100, 0), color(0, 150, 255));
    pieChart.setData("flights", data);    
  }
  
  void changeData(float[] data){
    pieChart.setData("flights", data);
  }
  
  void draw(int xPos, int yPos){
    stroke(0);
    fill(0, 45, 90);
    rect(xPos,yPos,20,20);
    fill(0, 45, 90);
    textFont(myFont, 16);

    text(("arrived (" + int(status[0]) + " out of " + totalFlights + ")"), xPos + 30,yPos + 15);
    fill(255, 100, 0);
    rect(xPos,yPos + 30,20,20);
    fill(0, 45, 90);

    text(("diverted (" + int(status[1]) + " out of " + totalFlights + ")"), xPos + 30, yPos + 45);

    fill(0, 150, 255);
    rect(xPos,yPos +  60,20,20);
    fill(0, 45, 90);
    text(("cancelled (" + int(status[2]) + " out of " + totalFlights + ")"), xPos + 30, yPos +75);
  }
  
}
