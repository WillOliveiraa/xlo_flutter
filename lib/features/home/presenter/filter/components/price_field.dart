import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceField extends StatelessWidget {
  const PriceField({
    required this.label,
    required this.onChanged,
    required this.initialValue,
  });

  final String label;
  final Function(String) onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          // prefixText: 'R\$ ',
          border: OutlineInputBorder(),
          isDense: true,
          labelText: label,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          RealInputFormatter(moeda: true),
        ],
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 16),
        onChanged: onChanged,
        initialValue: initialValue,
      ),
    );
  }
}
