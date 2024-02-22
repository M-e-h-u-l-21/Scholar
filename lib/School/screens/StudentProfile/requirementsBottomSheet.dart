import 'package:flutter/material.dart';

class RequirementsBottomSheet extends StatefulWidget {
  const RequirementsBottomSheet({Key? key}) : super(key: key);

  @override
  _RequirementsBottomSheetState createState() =>
      _RequirementsBottomSheetState();
}

class _RequirementsBottomSheetState extends State<RequirementsBottomSheet> {
  List<Map<String, dynamic>> requirements = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Requirements",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(height: 16),
          for (var requirement in requirements)
            ListTile(
              title: Text(requirement['name']),
              subtitle: Text(requirement['description']),
              trailing: Text('${requirement['amount']}'),
            ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _showAddRequirementDialog(context);
            },
            child: Text('Add Requirement'),
          ),
          ElevatedButton(
            onPressed: () {
              // Save requirements
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showAddRequirementDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Requirement'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                // Update name
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              onChanged: (value) {
                // Update amount
              },
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Description'),
              onChanged: (value) {
                // Update description
              },
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Add requirement
              requirements.add({
                'name': 'Name', // Get the entered name
                'amount': 0, // Get the entered amount
                'description': 'Description', // Get the entered description
              });
              Navigator.pop(context);
              setState(() {});
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
