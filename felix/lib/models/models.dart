class InfoGempa {
  final String tanggal;
  final String jam;
  final String dateTime;
  final String coordinate;
  final String lintang;
  final String bujur;
  final String magnitude;
  final String kedalaman;
  final String wilayah;
  final String potensi;
  final String dirasakan;
  final String shakeMap;

  InfoGempa({
    required this.tanggal,
    required this.jam,
    required this.dateTime,
    required this.coordinate,
    required this.lintang,
    required this.bujur,
    required this.magnitude,
    required this.kedalaman,
    required this.wilayah,
    required this.potensi,
    required this.dirasakan,
    required this.shakeMap,
  });

  factory InfoGempa.fromJson(Map<String, dynamic> json) {
    return InfoGempa(
      tanggal: json['Infogempa']['gempa']['Tanggal'],
      jam: json['Infogempa']['gempa']['Jam'],
      dateTime: json['Infogempa']['gempa']['Datetime'],
      coordinate: json['Infogempa']['gempa']['Coordinate'],
      lintang: json['Infogempa']['gempa']['Lintang'],
      bujur: json['Infogempa']['gempa']['Bujur'],
      magnitude: json['Infogempa']['gempa']['Magnitude'],
      kedalaman: json['Infogempa']['gempa']['Kedalaman'],
      wilayah: json['Infogempa']['gempa']['Wilayah'],
      potensi: json['Infogempa']['gempa']['Potensi'],
      dirasakan: json['Infogempa']['gempa']['Dirasakan'],
      shakeMap: json['Infogempa']['gempa']['Shakemap'],
    );
  }
}
