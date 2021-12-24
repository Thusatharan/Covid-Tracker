class DataModel {
  final int todayCases;
  final int todayDeath;
  final int totalDeath;
  final int totalCases;
  final int totalRecovered;
  final int totalActive;
  final int globalNewCases;
  final int globalNewDeaths;
  final int globalTotalCases;
  final int globalTotalRecovered;
  final int globalTotalDeaths;
  final String updatedAt;

  DataModel({
    this.todayCases,
    this.todayDeath,
    this.totalDeath,
    this.totalCases,
    this.totalRecovered,
    this.totalActive,
    this.updatedAt,
    this.globalNewCases,
    this.globalNewDeaths,
    this.globalTotalCases,
    this.globalTotalDeaths,
    this.globalTotalRecovered,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      todayCases: json['local_new_cases'],
      todayDeath: json['local_new_deaths'],
      totalDeath: json['local_deaths'],
      totalCases: json['local_total_cases'],
      totalRecovered: json['local_recovered'],
      totalActive: json['local_active_cases'],
      updatedAt: json['update_date_time'],
      globalNewCases: json['global_new_cases'],
      globalNewDeaths: json['global_new_deaths'],
      globalTotalCases: json['global_total_cases'],
      globalTotalRecovered: json['global_recovered'],
      globalTotalDeaths: json['global_deaths'],
    );
  }
}
