import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

import 'homePage.dart';

class FoodDonationForm extends StatefulWidget {
  const FoodDonationForm({Key? key}) : super(key: key);

  @override
  _FoodDonationFormState createState() => _FoodDonationFormState();
}

class _FoodDonationFormState extends State<FoodDonationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _selectedState;
  String? _selectedCity;
  String? _foodType;

  final List<String> _states = [
    'State 1',
    'State 2',
    'State 3',
  ];

  final Map<String, List<String>> _citiesData = {
    'State 1': ['City 1', 'City 2', 'City 3'],
    'State 2': ['City 4', 'City 5', 'City 6'],
    'State 3': ['City 7', 'City 8', 'City 9'],
  };
  List<String> _cities = [];

  final List<String> _foodTypes = ['Packaged', 'Fresh', 'Bakery', 'Beverages'];

  void _onStateSelected(String? selectedState) {
    setState(() {
      _selectedState = selectedState;
      _cities = _citiesData[selectedState]!;
      _selectedCity = null;
    });
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      showDialog(
        context: context,
        barrierDismissible:
            false, // Prevent closing the dialog by tapping outside
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text('Sit back and Hold a second...'),
            content: SizedBox(
                height: 100, width: 100, child: CircularProgressIndicator()),
          );
        },
      );

      // Mongo-DB Connection
      final db = await mongo.Db.create(
          "mongodb+srv://lituplayer:lll8117017978@cluster0.g186p7h.mongodb.net/?retryWrites=true&w=majority");
      await db.open();

      final collection = db.collection("ContributorsData");
      final document = {
        'id': mongo.ObjectId(),
        'name': _name,
        'email': _email,
        'state': _selectedState,
        'city': _selectedCity,
        'foodType': _foodType
      };

      try {
        Navigator.of(context).pop();

        await collection.insert(document);

        // Show a success pop-up
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Success'),
              content: const Text('Data inserted successfully.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } catch (e) {
        if (kDebugMode) {
          print('Error inserting data: $e');
        }

        // Show an error pop-up
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Failed to insert data.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
      await db.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Row(
                children: [
                  Text(
                    "Thanks ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  Text(
                    "For Coming This Far",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.pink),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  "Please fill out this form with the appropriate details"),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedState,
                items: _states.map((state) {
                  return DropdownMenuItem<String>(
                    value: state,
                    child: Text(state),
                  );
                }).toList(),
                onChanged: _onStateSelected,
                decoration: InputDecoration(
                  labelText: 'State',
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a state';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedCity,
                items: _cities.map((city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCity = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'City',
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a city';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _foodType,
                items: _foodTypes.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _foodType = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Food Type',
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a food type';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
