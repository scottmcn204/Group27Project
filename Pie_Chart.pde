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
    myPieChart.setColors("flights", color(#3BE8E6), color(#FFAF1A), color(#20396A));
    myPieChart.setData("flights", data);    
  }
  
  void changeData(float[] data){
    myPieChart.setData("flights", data);
  }
  
  void draw(int xPos, int yPos){
    fill(#3BE8E6);
    rect(xPos,yPos,20,20);
    fill(250);
    textFont(myFont, 16);

    text(("on time (" + int(status[0]) + " out of " + totalArrivals + ")"), xPos + 30,yPos + 15);
    fill(#FFAF1A);
    rect(xPos,yPos + 30,20,20);
    fill(250);

    text(("diverted (" + int(status[1]) + " out of " + totalArrivals + ")"), xPos + 30, yPos + 45);

    fill(#20396A);
    rect(xPos,yPos +  60,20,20);
    fill(250);
    text(("cancelled (" + int(status[2]) + " out of " + totalArrivals + ")"), xPos + 30, yPos +75);
  }
  
}
