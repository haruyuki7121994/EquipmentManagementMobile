class Equipment {
  Equipment({required this.id, required this.name, required this.qrcode, this.status, this.images});
  final String id;
  final String name;
  final String qrcode;
  final String? status;
  final List<Images>? images;

  factory Equipment.fromJson(Map<String, dynamic> data){
    final id =  data['data']['id'] as String;
    final name = data['data']['name'] as String;
    final qrcode = data['data']['qrcode'] as String;
    final status = data['data']['status'] as String?;
    final imagesData = data['data']['images'] as List<dynamic>?;
    final images = imagesData != null
        ? imagesData.map((imagesData) => Images.fromJson(imagesData))
        .toList()
        : <Images>[];
    return Equipment(
      id: id,
      name: name,
      qrcode: qrcode,
      status: status ?? 'null',
      images: images,
    );
  }
}

class Images {
  Images({ this.id,  this.name,  this.path});
  // non-nullable - assuming the score field is always present
  final String? id;
  // nullable - assuming the review field is optional
  final String? name;
  final String? path;

  factory Images.fromJson(Map<String, dynamic> data) {
    final id = data['id'];
    final name = data['name'];
    final path = data['path'];
    return Images(id: id, name: name, path: path);
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'path': path,
  //   };
  // }
}