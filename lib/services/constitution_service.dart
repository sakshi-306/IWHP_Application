import '../models/user_input.dart';

class ConstitutionService {
  static String analyze(UserInput input) {
    int vata = 0, pitta = 0, kapha = 0;

    // Body Type
    if (input.bodyType == 'thin') vata++;
    if (input.bodyType == 'muscular') pitta++;
    if (input.bodyType == 'heavier') kapha++;

    // Skin
    if (input.skinType == 'dry') vata++;
    if (input.skinType == 'oily') pitta++;
    if (input.skinType == 'balanced') kapha++;

    // Hair
    if (input.hairType == 'dry' || input.hairType == 'thin') vata++;
    if (input.hairType == 'oily') pitta++;
    if (input.hairType == 'thick') kapha++;

    // Eyes
    if (input.eyeSize == 'small') vata++;
    if (input.eyeSize == 'medium') pitta++;
    if (input.eyeSize == 'large') kapha++;

    // Mindset
    if (input.mindset == 'restless') vata++;
    if (input.mindset == 'intense') pitta++;
    if (input.mindset == 'calm') kapha++;

    // Memory
    if (input.memory == 'forgetful') vata++;
    if (input.memory == 'sharp') pitta++;
    if (input.memory == 'average') kapha++;

    // Emotions
    if (input.emotions == 'anxious') vata++;
    if (input.emotions == 'angry') pitta++;
    if (input.emotions == 'content') kapha++;

    // Diet
    if (input.diet == 'hot') vata++;
    if (input.diet == 'cold' || input.diet == 'spicy') pitta++;
    if (input.diet == 'sweet') kapha++;

    // Sleep
    if (input.sleep == 'light') vata++;
    if (input.sleep == 'troubled') pitta++;
    if (input.sleep == 'deep') kapha++;

    // Energy Level
    if (input.energyLevel == 'fatigue') vata++;
    if (input.energyLevel == 'energetic') pitta++;
    if (input.energyLevel == 'balanced') kapha++;

    // Climate Preference
    if (input.preferredClimate == 'hot') vata++;
    if (input.preferredClimate == 'cool') pitta++;
    if (input.preferredClimate == 'warm' || input.preferredClimate == 'moderate') kapha++;

    // Stress Response
    if (input.stressResponse == 'anxious') vata++;
    if (input.stressResponse == 'irritable') pitta++;
    if (input.stressResponse == 'calm') kapha++;

    // Determine dominant dosha
    final max = [vata, pitta, kapha].reduce((a, b) => a > b ? a : b);
    if (vata == max) return "Vata";
    if (pitta == max) return "Pitta";
    return "Kapha";
  }

  static String getSuggestions(String constitution) {
    switch (constitution) {
      case 'Vata':
        return "Follow a warm, moist diet. Stay grounded with regular routines. Avoid cold, dry environments. Prioritize rest.";
      case 'Pitta':
        return "Avoid heat and spicy food. Embrace calming, cooling activities. Practice mindfulness and stay hydrated.";
      case 'Kapha':
        return "Stay physically active. Eat light and warm foods. Avoid excessive sleep and heavy emotions.";
      default:
        return "Maintain balance through mindful eating, regular sleep, and emotional regulation.";
    }
  }
}
