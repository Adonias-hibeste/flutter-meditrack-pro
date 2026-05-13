class HealthVitals {
  final int heartRate;
  final int steps;
  final double sleepHours;
  final int wellnessScore;
  final String statusMessage;

  HealthVitals({
    required this.heartRate,
    required this.steps,
    required this.sleepHours,
    required this.wellnessScore,
    required this.statusMessage,
  });
}

class SymptomMessage {
  final String text;
  final bool isAi;
  final DateTime timestamp;
  final List<String> suggestions;

  SymptomMessage({
    required this.text,
    required this.isAi,
    required this.timestamp,
    this.suggestions = const [],
  });
}
