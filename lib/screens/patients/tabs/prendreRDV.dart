import 'package:flutter/material.dart';
import '../../../utils/utils.dart' as utils;

void main() => runApp(new MaterialApp(
      home: new PrendreRDV(),
    ));

class PrendreRDV extends StatefulWidget {
  static const String routeName = '/prendrerdv';
  @override
  State<StatefulWidget> createState() => PrendreRDVState();
}

class PrendreRDVState extends State<PrendreRDV> {
  String resume = "EST : ";
  int currentStep = 0;
  List<Step> steps = [
    new Step(
      content: new Text(
        'Choisir son médecin',
        style: utils.myStyleGlobal,
      ),
      state: StepState.indexed,
      title: new Text(
        'Avec quel médecin ?',
        style: utils.myStyleGlobal,
      ),
      isActive: true,
    ),
    new Step(
      title: new Text(
        'Quand ?',
        style: utils.myStyleGlobal,
      ),
      state: StepState.indexed,
      content: new Text(
        'Choisir son créneau horaire',
        style: utils.myStyleGlobal,
      ),
      isActive: true,
    ),
    new Step(
      content: new Text(
        'Confirmer le rendez-vous',
        style: utils.myStyleGlobal,
      ),
      title: new Text(
        'Votre confirmation',
        style: utils.myStyleGlobal,
      ),
      isActive: true,
    ),
    new Step(
      content: new Text(
        'Résumé du rendez-vous',
        style: utils.myStyleGlobal,
      ),
      state: StepState.complete,
      title: new Text(
        'Valider',
        style: utils.myStyleGlobal,
      ),
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: utils.colorGlobal,
        title: new Text('Prendre un rendez-vous'),
        elevation: 0.0,
      ),
      body: new Container(
        child: new Stepper(
          steps: steps,
          currentStep: currentStep,
          type: StepperType.vertical,
          onStepContinue: () {
            setState(() {
              if (currentStep == 3)
                Navigator.of(context).pushNamed('/monprofil');
              currentStep = currentStep < steps.length - 1
                  ? currentStep += 1
                  : currentStep = 3;
            });
          },
          onStepCancel: () {
            setState(() {
              if (currentStep == 0)
                Navigator.of(context).pushNamed('/monprofil');
              currentStep =
                  currentStep > 0 ? currentStep -= 1 : currentStep = 0;
            });
          },
        ),
      ),
    );
  }
}
