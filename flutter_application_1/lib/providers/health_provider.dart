import 'package:flutter/material.dart';
import '../models/health_data.dart';
import '../services/health_service.dart';

class HealthProvider with ChangeNotifier {
  HealthData? _healthData;

  HealthData? get healthData => _healthData;

  Future<void> fetchHealthData() async {
    try {
      _healthData = await HealthService.getHealthData();
      notifyListeners();
    } catch (e) {
      debugPrint("Error fetching health data: $e");
    }
  }
}
