import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  // Controllers for each input field
  final TextEditingController nameController = TextEditingController();
  final TextEditingController venueController = TextEditingController();
  final TextEditingController participantController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // Variables for date and image
  DateTime? selectedDate;
  String? imagePath;

  // Method to pick a date
  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Method to pick an image (this requires image_picker package)
  Future<void> _pickImage() async {
     final picker = ImagePicker();
     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    setState(() {
      imagePath = pickedFile.path;
    });
  }
  }

  // Method to handle form submission
  void _submitForm() {
    // Gather data from controllers and perform validation if needed
    final eventName = nameController.text;
    final venue = venueController.text;
    final participantCount = int.tryParse(participantController.text) ?? 0;
    final description = descriptionController.text;

    // Perform your logic to save the event data (e.g., saving to a database)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Event Name Field
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Event Name'),
              ),

              // Event Date Field
              TextButton(
                onPressed: _pickDate,
                child: Text(
                  selectedDate == null
                      ? 'Pick a Date'
                      : 'Date: ${selectedDate!.toLocal()}'.split(' ')[0],
                ),
              ),

              // Event Venue Field
              TextField(
                controller: venueController,
                decoration: InputDecoration(labelText: 'Venue'),
              ),

              // Participant Field
              TextField(
                controller: participantController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Participants'),
              ),

              // Description Field
              TextField(
                controller: descriptionController,
                maxLines: 3,
                decoration: InputDecoration(labelText: 'Description'),
              ),

              // Image Picker Button
              TextButton(
                onPressed: _pickImage,
                child: Text('Pick an Image'),
              ),
              if (imagePath != null)
                Image.file(
                  File(imagePath!),
                  height: 100,
                  width: 100,
                ),

              // Submit Button
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddEventPage()),
    );
  },
  child: Text('Add New Event'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
