import 'package:flutter/material.dart';
import '../models/user_input.dart';
import '../services/constitution_service.dart';

class InputFormScreen extends StatefulWidget {
  @override
  _InputFormScreenState createState() => _InputFormScreenState();
}

class _InputFormScreenState extends State<InputFormScreen> {
  final _formKey = GlobalKey<FormState>();

  String bodyType = 'thin';
  String skinType = 'dry';
  String hairType = 'dry';
  String eyeSize = 'small';
  String mindset = 'restless';
  String memory = 'forgetful';
  String emotions = 'anxious';
  String diet = 'hot';
  String sleep = 'light';
  String energyLevel = 'fatigue';
  String climate = 'warm';
  String stressResponse = 'anxious';

  final List<String> threeOptions = ['thin', 'muscular', 'heavier'];
  final List<String> skinOptions = ['dry', 'oily', 'balanced'];
  final List<String> hairOptions = ['dry', 'oily', 'thick', 'thin'];
  final List<String> eyeOptions = ['small', 'medium', 'large'];
  final List<String> mindsetOptions = ['calm', 'intense', 'restless'];
  final List<String> memoryOptions = ['sharp', 'average', 'forgetful'];
  final List<String> emotionOptions = ['angry', 'anxious', 'content'];
  final List<String> dietOptions = ['hot', 'cold', 'spicy', 'sweet'];
  final List<String> sleepOptions = ['deep', 'light', 'troubled'];
  final List<String> energyOptions = ['energetic', 'balanced', 'fatigue'];
  final List<String> climateOptions = ['cool', 'warm', 'moderate'];
  final List<String> stressOptions = ['anxious', 'irritable', 'calm'];

  @override
  Widget build(BuildContext context) {
    final dropdownStyle = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      labelStyle: TextStyle(color: Colors.indigo.shade700, fontWeight: FontWeight.w600),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.indigo.shade100),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Know Your Prakriti',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
      ),
      body: Container(
        color: Colors.amber.shade50,
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildDropdown('Body Type', bodyType, threeOptions, (val) => setState(() => bodyType = val!), dropdownStyle),
              _buildDropdown('Skin Type', skinType, skinOptions, (val) => setState(() => skinType = val!), dropdownStyle),
              _buildDropdown('Hair Type', hairType, hairOptions, (val) => setState(() => hairType = val!), dropdownStyle),
              _buildDropdown('Eye Size', eyeSize, eyeOptions, (val) => setState(() => eyeSize = val!), dropdownStyle),
              _buildDropdown('Mindset', mindset, mindsetOptions, (val) => setState(() => mindset = val!), dropdownStyle),
              _buildDropdown('Memory', memory, memoryOptions, (val) => setState(() => memory = val!), dropdownStyle),
              _buildDropdown('Emotions', emotions, emotionOptions, (val) => setState(() => emotions = val!), dropdownStyle),
              _buildDropdown('Diet Preference', diet, dietOptions, (val) => setState(() => diet = val!), dropdownStyle),
              _buildDropdown('Sleep Pattern', sleep, sleepOptions, (val) => setState(() => sleep = val!), dropdownStyle),
              _buildDropdown('Energy Level', energyLevel, energyOptions, (val) => setState(() => energyLevel = val!), dropdownStyle),
              _buildDropdown('Preferred Climate', climate, climateOptions, (val) => setState(() => climate = val!), dropdownStyle),
              _buildDropdown('Stress Response', stressResponse, stressOptions, (val) => setState(() => stressResponse = val!), dropdownStyle),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[800],
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                child: Text('Analyze', style: TextStyle(color: Colors.amber.shade100)),
                onPressed: () {
                  final input = UserInput(
                    bodyType: bodyType,
                    skinType: skinType,
                    hairType: hairType,
                    eyeSize: eyeSize,
                    mindset: mindset,
                    memory: memory,
                    emotions: emotions,
                    diet: diet,
                    sleep: sleep,
                    energyLevel: energyLevel,
                    preferredClimate: climate,
                    stressResponse: stressResponse,
                  );
                  _showResultDialog(context, input);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    String value,
    List<String> options,
    ValueChanged<String?> onChanged,
    InputDecoration decoration,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: decoration.copyWith(labelText: label),
        items: options
            .map((option) => DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                ))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  void _showResultDialog(BuildContext context, UserInput input) {
    final constitution = ConstitutionService.analyze(input);
    final suggestion = ConstitutionService.getSuggestions(constitution);

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: EdgeInsets.all(20),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.spa_rounded, size: 60, color: Colors.deepPurple),
                SizedBox(height: 12),
                Text(
                  'Your Dominant Prakriti',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 14),
                Text(
                  constitution,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 8),
                Text(
                  'Suggestion:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  suggestion,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.6,
                    color: Colors.grey[800],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Close', style: TextStyle(color: Colors.white)),
                  onPressed: () => Navigator.of(ctx).pop(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
