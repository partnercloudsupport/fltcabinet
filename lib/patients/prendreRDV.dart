import 'package:flutter/material.dart';
import '../utils/utils.dart' as utils;

void main() => runApp(new MaterialApp(
      home: new PrendreRDV(),
    ));

class PrendreRDV extends StatefulWidget {
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
        style: utils.getMyStyleGlobal(),
      ),
      title: new Text(
        'Avec quel médecin ?',
        style: utils.getMyStyleGlobal(),
      ),
      isActive: true,
    ),
    new Step(
      title: new Text(
        'Quand ?',
        style: utils.getMyStyleGlobal(),
      ),
      content: new Text(
        'Choisir son créneau horaire',
        style: utils.getMyStyleGlobal(),
      ),
    ),
    new Step(
      content: new Text(
        'Confirmer le rendez-vous',
        style: utils.getMyStyleGlobal(),
      ),
      title: new Text(
        'Votre confirmation',
        style: utils.getMyStyleGlobal(),
      ),
      isActive: true,
    ),
    new Step(
      content: new Text(
        'Résumé du rendez-vous',
        style: utils.getMyStyleGlobal(),
      ),
      title: new Text(
        'Valider',
        style: utils.getMyStyleGlobal(),
      ),
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: utils.colorGlobal(),
        title: new Text('Prendre un rendez-vous'),
      ),
      body: new Container(
        child: new Stepper(
          steps: steps,
          currentStep: currentStep,
          type: StepperType.vertical,
          onStepContinue: () {
            setState(() {
              currentStep = currentStep < steps.length - 1
                  ? currentStep += 1
                  : currentStep = 3;
              resume = resume + " -> " + currentStep.toString();
              print(resume);
            });
          },
          onStepCancel: () {
            setState(() {
              currentStep =
                  currentStep > 0 ? currentStep -= 1 : currentStep = 0;
            });
          },
        ),
      ),
    );
  }
}
