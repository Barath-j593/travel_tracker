import 'package:flutter/material.dart';
import 'package:travel_tracker/utils/constants.dart';

class CompanionScreen extends StatefulWidget {
  @override
  _CompanionScreenState createState() => _CompanionScreenState();
}

class _CompanionScreenState extends State<CompanionScreen> {
  final List<Map<String, String>> _companions = [
    {'name': 'John Doe', 'phone': '+1234567890'},
    {'name': 'Jane Smith', 'phone': '+0987654321'},
    {'name': 'Robert Johnson', 'phone': '+1122334455'},
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _addCompanion() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _companions.add({
          'name': _nameController.text,
          'phone': _phoneController.text,
        });
        _nameController.clear();
        _phoneController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Companion added successfully')),
      );
    }
  }

  void _removeCompanion(int index) {
    setState(() {
      _companions.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Companion removed')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Travel Companions')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add New Companion',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          prefixIcon: Icon(Icons.phone),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a phone number';
                          }
                          if (value.length < 10) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _addCompanion,
                        child: Text('Add Companion'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            Text(
              'Your Companions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            _companions.isEmpty
                ? Center(
                    child: Text(
                      'No companions added yet',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _companions.length,
                    itemBuilder: (context, index) {
                      final companion = _companions[index];
                      return CompanionTile(
                        name: companion['name']!,
                        phone: companion['phone']!,
                        onDelete: () => _removeCompanion(index),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

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