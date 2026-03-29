import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/providers/connectivity_provider.dart';
import 'onboarding_form_provider.dart';
import 'onboarding_providers.dart';
import 'onboarding_state.dart';

class OnboardingController extends Notifier<OnboardingState> {
  @override
  OnboardingState build() => const OnboardingState();

  Future<void> submit() async {
    final form = ref.read(onboardingFormProvider);

    state = state.copyWith(isLoading: true, error: null, isOffline: false);

    try {
      final isConnected = await ref.read(connectivityProvider).isConnected();

      if (!isConnected) {
        throw NetworkException();
      }

      final createPet = ref.read(createPetUseCaseProvider);
      final getRecommendation = ref.read(getRecommendationUseCaseProvider);

      final petEntity = form.toEntity();

      final petId = await createPet(petEntity);
      final recommendation = await getRecommendation(petId);

      await ref.read(onboardingFormProvider.notifier).saveProfile();

      state = state.copyWith(isLoading: false, recommendation: recommendation);
    } on NetworkException {
      state = state.copyWith(isLoading: false, isOffline: true);
    } on ServerException catch (e) {
      state = state.copyWith(isLoading: false, error: e.message);
    } catch (_) {
      state = state.copyWith(isLoading: false, error: 'Something went wrong');
    }
  }
}

final onboardingControllerProvider =
    NotifierProvider<OnboardingController, OnboardingState>(
      OnboardingController.new,
    );
