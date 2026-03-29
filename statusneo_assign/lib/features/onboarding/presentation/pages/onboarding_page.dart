import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/route_names.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../../../core/widgets/no_connection_view.dart';
import '../../../../core/widgets/shimmer/recommendation_shimmer.dart';
import '../providers/onboarding_controller.dart';
import '../providers/onboarding_form_provider.dart';
import '../providers/onboarding_state.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _breedController;
  late final TextEditingController _ageYearsController;
  late final TextEditingController _ageMonthsController;
  late final TextEditingController _weightController;

  @override
  void initState() {
    super.initState();

    final form = ref.read(onboardingFormProvider);

    _nameController = TextEditingController(text: form.name);
    _breedController = TextEditingController(text: form.breed);
    _ageYearsController = TextEditingController(text: form.ageYears);
    _ageMonthsController = TextEditingController(text: form.ageMonths);
    _weightController = TextEditingController(text: form.weight);

    ref.listenManual<OnboardingState>(onboardingControllerProvider, (
      prev,
      next,
    ) {
      if (mounted && next.recommendation != null) {
        context.go(RouteNames.recommendation);
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _breedController.dispose();
    _ageYearsController.dispose();
    _ageMonthsController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final form = ref.watch(onboardingFormProvider);
    final controller = ref.watch(onboardingControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Pet Onboarding')),
      body: Stack(
        children: [
          _buildForm(form, controller),
          if (controller.isLoading)
            Container(
              color: Colors.black.withOpacity(0.08),
              child: const RecommendationShimmer(),
            ),
        ],
      ),
    );
  }

  Widget _buildForm(OnboardingFormState form, OnboardingState state) {
    final notifier = ref.read(onboardingFormProvider.notifier);

    if (state.isOffline) {
      return NoConnectionView(
        onRetry: () {
          ref.read(onboardingControllerProvider.notifier).submit();
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            if (state.error != null) ErrorStateView(message: state.error!),

            _textField(
              controller: _nameController,
              label: 'Name',
              onChanged: notifier.updateName,
              validator: (v) => Validators.requiredField(v, 'Name'),
            ),

            _dropdown(
              label: 'Species',
              value: form.species,
              items: const ['dog', 'cat'],
              onChanged: notifier.updateSpecies,
            ),

            _textField(
              controller: _breedController,
              label: 'Breed',
              onChanged: notifier.updateBreed,
              validator: (v) => Validators.requiredField(v, 'Breed'),
            ),

            _textField(
              controller: _ageYearsController,
              label: 'Age (Years)',
              onChanged: notifier.updateAgeYears,
              validator: (v) => Validators.requiredField(v, 'Age years'),
              keyboardType: TextInputType.number,
            ),

            _textField(
              controller: _ageMonthsController,
              label: 'Age (Months)',
              onChanged: notifier.updateAgeMonths,
              validator: (v) => Validators.requiredField(v, 'Age months'),
              keyboardType: TextInputType.number,
            ),

            _textField(
              controller: _weightController,
              label: 'Weight (kg)',
              onChanged: notifier.updateWeight,
              validator: (v) => Validators.positiveNumber(v, 'Weight'),
              keyboardType: TextInputType.number,
            ),

            _dropdown(
              label: 'Activity Level',
              value: form.activityLevel,
              items: const ['low', 'medium', 'high'],
              onChanged: notifier.updateActivity,
            ),

            const SizedBox(height: 12),
            const Text(
              'Allergies',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ['chicken', 'lamb', 'turkey', 'salmon', 'venison']
                  .map(
                    (allergy) => FilterChip(
                      label: Text(allergy),
                      selected: form.allergies.contains(allergy),
                      onSelected: (_) => notifier.toggleAllergy(allergy),
                    ),
                  )
                  .toList(),
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
    required TextEditingController controller,
    required String label,
    required Function(String) onChanged,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
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

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ref.read(onboardingControllerProvider.notifier).submit();
    }
  }
}
