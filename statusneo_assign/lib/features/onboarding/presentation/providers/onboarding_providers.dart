import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/dio_provider.dart';
import '../../data/datasources/onboarding_remote_data_source.dart';
import '../../data/repositories/onboarding_repository_impl.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../../domain/usecases/create_pet_usecase.dart';
import '../../domain/usecases/get_recommendation_usecase.dart';

final onboardingRemoteDataSourceProvider = Provider(
  (ref) => OnboardingRemoteDataSource(ref.read(dioProvider)),
);

final onboardingRepositoryProvider = Provider<OnboardingRepository>(
  (ref) => OnboardingRepositoryImpl(
    ref.read(onboardingRemoteDataSourceProvider),
  ),
);

final createPetUseCaseProvider = Provider(
  (ref) => CreatePetUseCase(ref.read(onboardingRepositoryProvider)),
);

final getRecommendationUseCaseProvider = Provider(
  (ref) => GetRecommendationUseCase(ref.read(onboardingRepositoryProvider)),
);