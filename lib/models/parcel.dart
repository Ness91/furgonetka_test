class Parcel {
  String? packageNo;
  int? width;
  int? height;
  int? depth;
  double? weight;

  Parcel({
    this.packageNo,
    this.width,
    this.height,
    this.depth,
    this.weight,
  });

  Parcel.fromJson(Map<String, dynamic> json) {
    packageNo = json['package_no'];
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
    weight = json['weight'];
  }
}
