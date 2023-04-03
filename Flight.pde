class Flight {
  int date; //day only since month-year are the same
  String airlineCarrier;
  int flightNumber;
  String originAirport;
  String originCity;
  String originState;
  int originWAC;
  String destinationAirport;
  String destinationCity;
  String destinationState;
  int destinationWAC;
  int CRSDepartureTime;
  int actualDepartureTime;
  int CRSArrivalTime;
  int actualArrivalTime;
  boolean cancelled;
  boolean diverted;
  int distance;

  Flight(String date, String airlineCarrier, int flightNumber, String originAirport, String originCity,
   String originState, int originWAC, String destinationAirport, String destinationCity, String destinationState,
   int destinationWAC, int CRSDepartureTime, int actualDepartureTime, int CRSArrivalTime, int actualArrivalTime, boolean cancelled,
   boolean diverted, int distance) {
    String[] splitDate = date.split(" ");
    String[] splitDay = splitDate[0].split("/");
    this.date = Integer.parseInt(splitDay[1]);
    this.airlineCarrier = airlineCarrier;
    this.flightNumber = flightNumber;
    this.originAirport = originAirport;
    this.originCity = originCity;
    this.originState = originState;
    this.originWAC = originWAC;
    this.destinationAirport = destinationAirport;
    this.destinationCity = destinationCity;
    this.destinationState = destinationState;
    this.destinationWAC = destinationWAC;
    this.CRSDepartureTime = CRSDepartureTime;
    this.actualDepartureTime = actualDepartureTime;
    this.CRSArrivalTime = CRSArrivalTime;
    this.actualArrivalTime = actualArrivalTime;
    this.cancelled = cancelled;
    this.diverted = diverted;
    this.distance = distance;
  }
  /*isLate determines whether a flight is late or not by comparing CRS and
      actual arrival times. Returns false if a flight is diverted/cancelled.
  */
  boolean isLate() {
    if (this.diverted || this.cancelled) return false;
    else {
      int difference = Math.abs(this.actualArrivalTime -  this.CRSArrivalTime);
      if (difference >= 50) return true;
      else return false;
    }
  }
  
 double CO2emission(){
   double CO2;
   if (!(this.diverted || this.cancelled)){
     int minDep = (actualDepartureTime % 100);
     int hoursDep = (actualDepartureTime / 100);
     int minArr = (actualArrivalTime % 100);
     int hoursArr = (actualArrivalTime / 100);
     int hours;
     int minutes = minDep + minArr;
     if (hoursDep > hoursArr){
       hours = hoursArr + (24 - hoursDep);
     }
     else{
       hours = hoursArr - hoursDep; 
     }
     
     int seconds = (minutes * 60) + (hours * 3600);
     CO2 = (3.2 * seconds)*3.1;
   }
   else{
     CO2 = 0;
   }
   
   
   return CO2;
 }
  
}
