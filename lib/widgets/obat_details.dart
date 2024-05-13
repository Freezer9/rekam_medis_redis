import 'package:flutter/cupertino.dart';

class ObatDetails extends StatelessWidget {
  final int quantity;
  final String? selectedType;
  final int? selectedWaktu;
  final String? catatan;
  final Function(int) onQuantityIncrement;
  final Function(int) onQuantityDecrement;
  const ObatDetails({
    super.key,
    required this.quantity,
    required this.selectedType,
    required this.selectedWaktu,
    required this.catatan,
    required this.onQuantityIncrement,
    required this.onQuantityDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}