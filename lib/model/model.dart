class Rate {
  final String result;
  final String baseCode;
  final String timeLastUpdateUtc;
  final Map<String, dynamic> conversionRates;

  Rate({
    required this.result,
    required this.baseCode,
    required this.timeLastUpdateUtc,
    required this.conversionRates,
  });

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
    result: json["result"],
    baseCode: json["base_code"],
    timeLastUpdateUtc: json["time_last_update_utc"],
    conversionRates: json["conversion_rates"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "base_code": baseCode,
    "time_last_update_utc": timeLastUpdateUtc,
    "conversion_rates": conversionRates,
  };
}
