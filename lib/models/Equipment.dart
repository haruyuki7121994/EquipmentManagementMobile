class Equipment {
  Equipment({required this.id, required this.name, required this.qrcode, this.status});
  final String id;
  final String name;
  final String qrcode;
  final String? status;

  factory Equipment.fromJson(Map<String, dynamic> data){
    return Equipment(
        id: data['id'] as String,
        name: data['name'] as String,
        qrcode: data['status'] as String,
        status: data['status'] as String?
    );
  }
}

