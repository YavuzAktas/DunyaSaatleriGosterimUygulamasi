class TimeData {
  String abbreviation;
  String clientIp;
  DateTime datetime;
  int dayOfWeek;
  int dayOfYear;
  bool dst;
  dynamic dstFrom;
  int dstOffset;
  dynamic dstUntil;
  int rawOffset;
  String timezone;
  int unixtime;
  DateTime utcDatetime;
  String utcOffset;
  int weekNumber;

  TimeData({
    required this.abbreviation,
    required this.clientIp,
    required this.datetime,
    required this.dayOfWeek,
    required this.dayOfYear,
    required this.dst,
    required this.dstFrom,
    required this.dstOffset,
    required this.dstUntil,
    required this.rawOffset,
    required this.timezone,
    required this.unixtime,
    required this.utcDatetime,
    required this.utcOffset,
    required this.weekNumber,
  });

  factory TimeData.fromJson(Map<String, dynamic> json) => TimeData(
        abbreviation: json["abbreviation"],
        clientIp: json["client_ip"],
        datetime: DateTime.parse(json["datetime"]),
        dayOfWeek: json["day_of_week"],
        dayOfYear: json["day_of_year"],
        dst: json["dst"],
        dstFrom: json["dst_from"],
        dstOffset: json["dst_offset"],
        dstUntil: json["dst_until"],
        rawOffset: json["raw_offset"],
        timezone: json["timezone"],
        unixtime: json["unixtime"],
        utcDatetime: DateTime.parse(json["utc_datetime"]),
        utcOffset: json["utc_offset"],
        weekNumber: json["week_number"],
      );
}
