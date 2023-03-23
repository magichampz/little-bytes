import 'package:flutter/material.dart';
import 'package:flutter_onboarding/models/vaccination_data.dart';

class VaccinationCard extends StatelessWidget {
  final VaccinationData data;

  VaccinationCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(data.name),
        subtitle: Text(data.status),
      ),
    );
  }
}
