import 'package:appqrcode/models/Equipment.dart';

class Maintenance {

  final String id;
  final String dateMaintenance;
  final String user;
  final List<Equipment>? equipment;
  final int status;
  Maintenance({required this.id, required this. dateMaintenance, required this.equipment, required this.user, required this.status});

  factory Maintenance.fromJson(Map<String, dynamic> data){
    final id = data['id'];
    final equipmentData = data['equipments'] as List<dynamic>?;
    final user = data['user']['username'];
    final status = data['status'];
    final equipment = equipmentData != null
        ? equipmentData.map((equipmentData) => Equipment.fromJson(equipmentData))
        .toList()
        : <Equipment>[];
    final dateMaintenance = data['dateMaintenance'];

    return Maintenance(
        id: id,
        dateMaintenance: dateMaintenance,
        user: user,
        equipment: equipment,
        status: status,
    );
  }



}
// class MEquipment {
//   MEquipment({required this.id, required this.name, required this.qrcode, this.status, this.images, this.comments});
//   final String id;
//   final String name;
//   final String qrcode;
//   final int? status;
//   final List<Images>? images;
//   final List<Comments>? comments;
//
//   factory MEquipment.fromJson(Map<String, dynamic> data){
//     final id =  data['id'] as String;
//     final name = data['name'] as String;
//     final qrcode = data['qrcode'] as String;
//     final status = data['status'] as int;
//     final imagesData = data['images'] as List<dynamic>?;
//     final images = imagesData != null
//         ? imagesData.map((imagesData) => Images.fromJson(imagesData))
//         .toList()
//         : <Images>[];
//     final commentsData = data['comments'] as List<dynamic>?;
//     final comments = commentsData != null
//         ? commentsData.map((commentsData) => Comments.fromJson(commentsData))
//         .toList()
//         : <Comments>[];
//     return MEquipment(
//       id: id,
//       name: name,
//       qrcode: qrcode,
//       status: status,
//       images: images,
//       comments: comments,
//     );
//   }
// }
//
// class Images {
//   Images({ this.id,  this.name,  this.path});
//   // non-nullable - assuming the score field is always present
//   final String? id;
//   // nullable - assuming the review field is optional
//   final String? name;
//   final String? path;
//
//   factory Images.fromJson(Map<String, dynamic> data) {
//     final id = data['id'];
//     final name = data['name'];
//     final path = data['path'];
//     return Images(id: id, name: name, path: path);
//   }
//
// // Map<String, dynamic> toJson() {
// //   return {
// //     'id': id,
// //     'name': name,
// //     'path': path,
// //   };
// // }
// }
//
// class Comments {
//   Comments({ required this.id, required this.title, required this.description, required this.createdAt, required this.userId});
//   final String id;
//   final String title;
//   final String description;
//   final String createdAt;
//   final String userId;
//
//   factory Comments.fromJson(Map<String, dynamic> data) {
//     final id = data['id'];
//     final title = data['title'];
//     final description = data['description'];
//     final createdAt = data['createdAt'];
//     final userId = data['user']['username'];
//
//     return Comments(id: id, title: title, description: description, createdAt: createdAt, userId: userId);
//   }
// }

class MUser {
  final String username;
  final String email;
  final String phone;
  final String address;


  const MUser({
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
  });

  factory MUser.fromJson(Map<String, dynamic> json) {
    return MUser(
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
    );
  }
}