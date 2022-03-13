
class Equipment {
  Equipment({required this.id, required this.name, required this.qrcode, this.status, this.images, this.comments, this.description, this.location, this.width, this.height, this.weight, this.category, this.createdAt, this.resolution, this.range});
  final String id;
  final String name;
  final String qrcode;
  final int? status;
  final String? description;
  final String? location;
  final double? width;
  final double? height;
  final double? range;
  final double? resolution;
  final double? weight;
  final String? createdAt;
  final String? category;
  final List<Images>? images;
  final List<Comments>? comments;

  factory Equipment.fromJson(Map<String, dynamic> data){

      final id =  data['id'] as String;
      final name = data['name'] as String;
      final qrcode = data['qrcode'] as String;
      final status = data['status'] as int?;
      final description = data['description'] as String?;
      final location = data['location'] as String?;
      final width = data['width'] as double?;
      final height = data['height'] as double?;
      final range = data['range'] as double?;
      final resolution = data['resolution'] as double?;
      final weight = data['weight'] as double?;
      final createdAt = data['createdAt'] as String?;
      final category = data['category']['name'] as String?;
      final imagesData = data['images'] as List<dynamic>?;
      final images = imagesData != null
          ? imagesData.map((imagesData) => Images.fromJson(imagesData))
          .toList()
          : <Images>[];
      final commentsData = data['comments'] as List<dynamic>?;
      final comments = commentsData != null
          ? commentsData.map((commentsData) => Comments.fromJson(commentsData))
          .toList()
          : <Comments>[];
      return Equipment(
        id: id,
        name: name,
        qrcode: qrcode,
        status: status,
        description: description ?? "",
        location: location ?? "",
        width: width,
        height: height,
        range: range,
        resolution: resolution,
        weight: weight,
        createdAt: createdAt,
        category: category,
        images: images,
        comments: comments,
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

class Comments {
  Comments({ required this.id, required this.title, required this.description, required this.createdAt, required this.userId});
  final String id;
  final String title;
  final String description;
  final String createdAt;
  final String userId;

  factory Comments.fromJson(Map<String, dynamic> data) {
    final id = data['id'];
    final title = data['title'];
    final description = data['description'];
    final createdAt = data['createdAt'];
    final userId = data['user']['username'];

    return Comments(id: id, title: title, description: description, createdAt: createdAt, userId: userId);
  }
}