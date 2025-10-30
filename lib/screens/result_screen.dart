import 'package:flutter/material.dart';
import '../models/user_input.dart';
import '../services/constitution_service.dart';

class ResultScreen extends StatelessWidget {
  final UserInput input;

  ResultScreen({required this.input});

  @override
  Widget build(BuildContext context) {
    final constitution = ConstitutionService.analyze(input);
    final suggestion = ConstitutionService.getSuggestions(constitution);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dosha Type'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade400,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Icon(Icons.spa_rounded, size: 90, color: Colors.deepPurple.shade400),
            SizedBox(height: 20),
            Text(
              'Your Dominant Prakriti ',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple.shade700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(
                      constitution,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    SizedBox(height: 12),
                    Divider(color: Colors.grey[300], thickness: 1),
                    SizedBox(height: 16),
                    Text(
                      'Suggestion:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      suggestion,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[900],
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
           
          ],
        ),
      ),
    );
  }
}
