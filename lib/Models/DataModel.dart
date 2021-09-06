class DataModel {
  final int todayCases;
  final int todayDeath;
  final int totalDeath;
  final String updatedAt;

  DataModel(
      {this.todayCases, this.todayDeath, this.totalDeath, this.updatedAt});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      todayCases: json['local_new_cases'],
      todayDeath: json['local_new_deaths'],
      totalDeath: json['local_deaths'],
      updatedAt: json['update_date_time'],
    );
  }
}
