import 'dart:math';

import '../models/health_data.dart';

class HealthService {
  static Future<HealthData> getHealthData() async {
    // Simulating an API call
    await Future.delayed(Duration(seconds: 1));
    return HealthData(
      steps: Random().nextInt(10000),
      caloriesBurned: Random().nextDouble() * 2000,
      heartRate: 60 + Random().nextInt(40),
    );
  }
}
