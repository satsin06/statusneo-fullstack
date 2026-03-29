import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/error_mapper.dart';
import '../models/create_pet_request_model.dart';
import '../models/create_pet_response_model.dart';
import '../models/recommendation_model.dart';

class OnboardingRemoteDataSource {
  final Dio dio;

  OnboardingRemoteDataSource(this.dio);

  Future<String> createPet(CreatePetRequestModel request) async {
    try {
      final response = await dio.post(
        ApiConstants.pets,
        data: request.data,
      );

      final model = CreatePetResponseModel.fromJson(response.data);
      return model.id;
    } on DioException catch (e) {
      throw ErrorMapper.mapDioError(e);
    }
  }

  Future<RecommendationModel> getRecommendation(String petId) async {
    try {
      final response = await dio.get(
        '${ApiConstants.pets}/$petId/recommendation',
      );

      return RecommendationModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ErrorMapper.mapDioError(e);
    }
  }
}