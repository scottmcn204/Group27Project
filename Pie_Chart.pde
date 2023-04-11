import org.gicentre.utils.stat.*;   
import controlP5.*;

class PieChart{
  
  Chart myPieChart;
  
  PieChart(float[] data, int xPos, int yPos){
    myPieChart = cp5.addChart("pie")
                    .setPosition(xPos, yPos)
                    .setSize(300, 300)
                    .setRange(0, 1000)
                    .setView(Chart.PIE)
                    .setCaptionLabel("DIVERTED");
                    
    myPieChart.getColor().setBackground(color(255, 100));
    myPieChart.addDataSet("flights");
    myPieChart.setColors("flights", color(0, 45, 90), color(255, 100, 0), color(0, 150, 255));
    myPieChart.setData("flights", data);    
  }
  
  void changeData(float[] data){
    myPieChart.setData("flights", data);
  }
  
  void draw(int xPos, int yPos){
    stroke(0);
    fill(0, 45, 90);
    rect(xPos,yPos,20,20);
    fill(0, 45, 90);
    textFont(myFont, 16);

    text(("on time (" + int(status[0]) + " out of " + totalArrivals + ")"), xPos + 30,yPos + 15);
    fill(255, 100, 0);
    rect(xPos,yPos + 30,20,20);
    fill(0, 45, 90);

    text(("diverted (" + int(status[1]) + " out of " + totalArrivals + ")"), xPos + 30, yPos + 45);

    fill(0, 150, 255);
    rect(xPos,yPos +  60,20,20);
    fill(0, 45, 90);
    text(("cancelled (" + int(status[2]) + " out of " + totalArrivals + ")"), xPos + 30, yPos +75);
  }
  
}
