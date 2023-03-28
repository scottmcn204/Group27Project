class Flight {
  String date;
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
    this.date = date;
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
}
