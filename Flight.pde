class Flight {
  String MKT_CARRIER;
  int MKT_CARRIER_FL_NUM;
  String ORIGIN;
  String ORIGIN_CITY;
  String ORIGIN_STATE;
  int ORIGIN_WAC;
  String DEST;
  String DEST_CITY;
  String DEST_STATE;
  int DEST_WAC;
  int CRS_DEPT_TIME;
  int DEPT_TIME;
  int CRS_ARR_TIME;
  int ARR_TIME;
  boolean CANCELLED;
  boolean DIVERTED;
  int DISTANCE;

  Flight(String mktCarrier, int mktCarrierFlightNum, String origin, String originCity,
   String originState, int originWAC, String dest, String destCity, String destState,
   int destWAC, int CRSdeptTime, int deptTime, int CRSarrTime, int arrTime, boolean cancelled,
   boolean diverted, int distance) {
    this.MKT_CARRIER = mktCarrier;
    this.MKT_CARRIER_FL_NUM = mktCarrierFlightNum;
    this.ORIGIN = origin;
    this.ORIGIN_CITY = originCity;
    this.ORIGIN_STATE = originState;
    this.ORIGIN_WAC = originWAC;
    this.DEST = dest;
    this.DEST_CITY = destCity;
    this.DEST_STATE = destState;
    this.DEST_WAC = destWAC;
    this.CRS_DEPT_TIME = CRSdeptTime;
    this.DEPT_TIME = deptTime;
    this.CRS_ARR_TIME = CRSarrTime;
    this.ARR_TIME = arrTime;
    this.CANCELLED = cancelled;
    this.DIVERTED = diverted;
    this.DISTANCE = distance;
  }
  
}
