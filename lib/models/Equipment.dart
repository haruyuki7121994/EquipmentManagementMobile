import 'package:appqrcode/details/components/comment.dart';

class Equipment {
  Equipment({required this.id, required this.name, required this.qrcode, this.status, this.images, this.comments});
  final String id;
  final String name;
  final String qrcode;
  final String? status;
  final List<Images>? images;
  final List<Comments>? comments;

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
    final commentsData = data['data']['comments'] as List<dynamic>?;
    final comments = commentsData != null
        ? commentsData.map((commentsData) => Comments.fromJson(commentsData))
        .toList()
        : <Comments>[];
    return Equipment(
      id: id,
      name: name,
      qrcode: qrcode,
      status: status ?? 'null',
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