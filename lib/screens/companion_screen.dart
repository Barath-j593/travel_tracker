import 'package:flutter/material.dart';
import 'package:travel_tracker/l10n/app_localizations.dart';
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

  void _addCompanion(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

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
        SnackBar(content: Text(loc.companionAdded)),
      );
    }
  }

  void _removeCompanion(BuildContext context, int index) {
    final loc = AppLocalizations.of(context)!;

    setState(() {
      _companions.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(loc.companionRemoved)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(loc.travelCompanions)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loc.addNewCompanion,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                          labelText: loc.name,
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return loc.enterName;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: loc.phoneNumber,
                          prefixIcon: Icon(Icons.phone),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return loc.enterPhone;
                          }
                          if (value.length < 10) {
                            return loc.invalidPhone;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => _addCompanion(context),
                        child: Text(loc.addCompanion),
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
              loc.yourCompanions,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _companions.isEmpty
                ? Center(
                    child: Text(
                      loc.noCompanions,
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
                        onDelete: () => _removeCompanion(context, index),
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
        leading: CircleAvatar(child: Icon(Icons.person)),
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
