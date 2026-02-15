import 'package:flutter/material.dart';
import 'package:singit_onboarding_sdui/domain/sdui/entities/onboarding_entities.dart';
import 'list_component_model.dart';
import 'list_subcomponents.dart';

class ListComponent extends StatefulWidget {
  final OnboardingStep step;
  final Function(String optionId)? onOptionSelected;
  final VoidCallback? onContinue;

  const ListComponent({
    super.key,
    required this.step,
    this.onOptionSelected,
    this.onContinue,
  });

  @override
  State<ListComponent> createState() => _ListComponentState();
}

class _ListComponentState extends State<ListComponent> {
  String? _selectedOptionId;
  late ListComponentModel _model;

  @override
  void initState() {
    super.initState();
    _model = ListComponentModel.fromStep(
      widget.step.content,
      widget.step.assets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListHeader(),
        const SizedBox(height: 24),
        ListTitleBubble(
          title: _model.title,
          imageUrl: _model.imageUrl,
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: widget.step.options?.length ?? 0,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final option = widget.step.options![index];
              final isSelected = _selectedOptionId == option.id;

              return ListOptionItem(
                option: option,
                isSelected: isSelected,
                onTap: () {
                  setState(() {
                    _selectedOptionId = option.id;
                  });
                  widget.onOptionSelected?.call(option.id);
                },
              );
            },
          ),
        ),
        ListContinueButton(
          isEnabled: _selectedOptionId != null,
          onPressed: widget.onContinue,
        ),
      ],
    );
  }
}
