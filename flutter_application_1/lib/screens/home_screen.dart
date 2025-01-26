import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/health_provider.dart';
import '../widgets/stat_card.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final healthProvider = Provider.of<HealthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Health Connect'),
      ),
      body: Center(
        child: healthProvider.healthData == null
            ? ElevatedButton(
                onPressed: () => healthProvider.fetchHealthData(),
                child: Text('Fetch Health Data'),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StatCard(title: 'Steps', value: '${healthProvider.healthData!.steps}'),
                  StatCard(title: 'Calories', value: '${healthProvider.healthData!.caloriesBurned.toStringAsFixed(1)} kcal'),
                  StatCard(title: 'Heart Rate', value: '${healthProvider.healthData!.heartRate} bpm'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailsScreen()),
                      );
                    },
                    child: Text('View Details'),
                  ),
                ],
              ),
      ),
    );
  }
}