import 'package:flutter/material.dart';

class CompanionTile extends StatelessWidget {
  final String name;
  final String phone;
  final VoidCallback onDelete;

  const CompanionTile({
    Key? key,
    required this.name,
    required this.phone,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(name),
        subtitle: Text(phone),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}