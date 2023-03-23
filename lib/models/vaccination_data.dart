import 'package:flutter_onboarding/ui/screens/widgets/vaccine_widget.dart';

class VaccinationData {
  final String name;
  final String status;

  VaccinationData({required this.name, required this.status});

  static List<VaccinationData> vaccinationList = [
    VaccinationData(name: 'SARS stuff', status: 'Taken'),
    VaccinationData(name: 'another one', status: 'due next year')
  ];
}
