import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/shimmer/recommendation_shimmer.dart';
import '../providers/onboarding_controller.dart';
import '../providers/onboarding_form_provider.dart';
import '../providers/onboarding_state.dart';
import '../../../../app/router/route_names.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final form = ref.watch(onboardingFormProvider);
    final controller = ref.watch(onboardingControllerProvider);

    ref.listen<OnboardingState>(onboardingControllerProvider, (prev, next) {
      if (next.recommendation != null) {
        context.go(RouteNames.recommendation);
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Pet Onboarding')),
      body: Stack(
        children: [
          _buildForm(form),
          if (controller.isLoading)
            Container(
              color: Colors.black.withValues(alpha: 0.1),
              child: const RecommendationShimmer(),
            ),
        ],
      ),
    );
  }

  Widget _buildForm(OnboardingFormState form) {
    final notifier = ref.read(onboardingFormProvider.notifier);
    final state = ref.watch(onboardingControllerProvider);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            if (state.error != null) ErrorStateView(message: state.error!),

            _textField(
              label: 'Name',
              onChanged: notifier.updateName,
              validator: (v) => Validators.requiredField(v, 'Name'),
            ),

            _dropdown(
              label: 'Species',
              value: form.species,
              items: ['dog', 'cat'],
              onChanged: notifier.updateSpecies,
            ),

            _textField(
              label: 'Breed',
              onChanged: notifier.updateBreed,
              validator: (v) => Validators.requiredField(v, 'Breed'),
            ),

            _textField(
              label: 'Age (Years)',
              onChanged: notifier.updateAgeYears,
              validator: (v) => Validators.requiredField(v, 'Age years'),
              keyboardType: TextInputType.number,
            ),

            _textField(
              label: 'Age (Months)',
              onChanged: notifier.updateAgeMonths,
              validator: (v) => Validators.requiredField(v, 'Age months'),
              keyboardType: TextInputType.number,
            ),

            _textField(
              label: 'Weight (kg)',
              onChanged: notifier.updateWeight,
              validator: (v) => Validators.positiveNumber(v, 'Weight'),
              keyboardType: TextInputType.number,
            ),

            _dropdown(
              label: 'Activity Level',
              value: form.activityLevel,
              items: ['low', 'medium', 'high'],
              onChanged: notifier.updateActivity,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _submit,
              child: const Text('Get Recommendation'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textField({
    required String label,
    required Function(String) onChanged,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        decoration: InputDecoration(labelText: label),
        onChanged: onChanged,
        validator: validator,
        keyboardType: keyboardType,
      ),
    );
  }

  Widget _dropdown({
    required String label,
    required String value,
    required List<String> items,
    required Function(String) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        initialValue: value,
        decoration: InputDecoration(labelText: label),
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: (val) => onChanged(val!),
      ),
    );
  }

  // Widget _buildLoadingOverlay() {
  //   return Container(
  //     color: Colors.black.withOpacity(0.2),
  //     child: const Center(child: CircularProgressIndicator()),
  //   );
  // }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ref.read(onboardingControllerProvider.notifier).submit();
    }
  }
}
