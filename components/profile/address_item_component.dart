import 'package:flutter/material.dart';

class AddressItemComponent extends StatelessWidget {
  final Map<String, dynamic> address;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final ValueChanged<bool> onSelect;
  final bool isSelected;

  const AddressItemComponent({
    super.key,
    required this.address,
    required this.onEdit,
    required this.onDelete,
    required this.onSelect,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey[300]!),
        ),
        leading: Radio<bool>(
          value: true,
          groupValue: isSelected,
          onChanged: (value) => onSelect(value ?? false),
        ),
        title: Text(
          address['title'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "${address['street']}, ${address['number']}, ${address['neighborhood']}, ${address['city']}, ${address['state']}",
          style: const TextStyle(fontSize: 14),
        ),
        trailing: Wrap(
          spacing: 12,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.grey),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
