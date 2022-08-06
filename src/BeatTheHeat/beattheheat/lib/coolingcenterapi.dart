class CoolingCenter {
  String? name;
  double? longitude;
  double? latitude;
  String? address;
  String? description;

  CoolingCenter(
      {this.name,
      this.longitude,
      this.latitude,
      this.address,
      this.description});

  CoolingCenter.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    address = json['address'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['address'] = this.address;
    data['description'] = this.description;
    return data;
  }
}