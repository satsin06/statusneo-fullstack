class CreatePetResponseModel {
  final String id;

  CreatePetResponseModel({required this.id});

  factory CreatePetResponseModel.fromJson(Map<String, dynamic> json) {
    return CreatePetResponseModel(id: json['id']);
  }
}