import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChartView extends ConsumerWidget {
  ChartView({Key? key}) : super(key: key);

  final Set<int> _selectedIndices = {};

  final List<String> _options = [
    'Nature',
    'Tech',
    'Traditions',
    'Philosophy',
    'Art',
    'Leadership',
    'Food'
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 15.0,
      children: List<Widget>.generate(
        _options.length,
        (int index) {
          return ChoiceChip(
            label: Text(_options[index]),
            selected: _selectedIndices.contains(index),
            onSelected: (bool selected) {},
            iconTheme: const IconThemeData(
              color: Colors.black,
              size: 20.0,
            ),
            selectedColor: Colors.pink[400],
            backgroundColor: Colors.grey[300],
            disabledColor: Colors.grey,
            labelStyle: TextStyle(
              color: _selectedIndices.contains(index)
                  ? Colors.white
                  : Colors.black,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: const BorderSide(color: Colors.transparent)),
          );
        },
      ).toList(),
    );
  }
}
