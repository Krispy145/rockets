import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rockets/app/dependency_injection/injection_container.dart';
import 'package:rockets/app/helpers/sizes/spacers.dart';
import 'package:rockets/app/theme/app_theme.dart';
import 'package:rockets/blocs/rockets/rockets_bloc.dart';
import 'package:rockets/models/rocket/rocket_model.dart';

class RocketView extends StatelessWidget {
  final String id;

  const RocketView({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rocket View')),
      body: BlocProvider.value(
        value: Managers.rocketsBloc..add(FetchRocket(id)),
        child: BlocBuilder<RocketsBloc, RocketsState>(
          builder: (context, state) {
            if (state is RocketLoaded) {
              final rocketData = state.rocket;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rocketData.rocketName ?? 'No Rocket Name',
                        style: AppTheme.currentTheme.textTheme.titleLarge,
                      ),
                      Sizes.s.spacer(),
                      Text(rocketData.description ?? 'No Rocket Description'),
                      Sizes.m.spacer(),
                      Text('Details:', style: AppTheme.currentTheme.textTheme.bodyMedium),
                      Sizes.s.spacer(),
                      ...buildRocketDetails(rocketData),
                      const SizedBox(height: 20),
                      Text('Wikipedia: ${rocketData.wikipedia ?? 'no details'}'),
                    ],
                  ),
                ),
              );
            } else if (state is RocketsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RocketsError) {
              return const Center(child: Text('Error loading rocket data.'));
            } else {
              return const Center(child: Text('Unknown state.'));
            }
          },
        ),
      ),
    );
  }

  List<Widget> buildRocketDetails(RocketModel rocketModel) {
    return [
      buildTextItem('ID', rocketModel.id),
      buildTextItem('Active', rocketModel.active),
      buildTextItem('Stages', rocketModel.stages),
      buildTextItem('Boosters', rocketModel.boosters),
      buildTextItem('Cost per Launch', '\$${rocketModel.costPerLaunch}'),
      buildTextItem('Success Rate', '${rocketModel.successRatePct}%'),
      buildTextItem('First Flight', rocketModel.firstFlight),
      buildTextItem('Country', rocketModel.country),
      buildTextItem('Company', rocketModel.company),
      Sizes.m.spacer(),
      buildNestedText('Height', rocketModel.height?.meters, rocketModel.height?.feet),
      buildNestedText('Diameter', rocketModel.diameter?.meters, rocketModel.diameter?.feet),
      buildNestedText('Mass', rocketModel.mass?.kg, rocketModel.mass?.lb),
      Sizes.m.spacer(),
      buildPayloadWeights(rocketModel.payloadWeights),
      buildFirstStage(rocketModel.firstStage),
      buildSecondStage(rocketModel.secondStage),
      buildEngines(rocketModel.engines),
      buildLandingLegs(rocketModel.landingLegs),
    ];
  }

  Widget buildTextItem(String label, dynamic value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: ${value ?? 'no details'}'),
        Sizes.s.spacer(),
      ],
    );
  }

  Widget buildNestedText(String label, dynamic value1, dynamic value2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label:'),
        buildTextItem('Meters', value1),
        buildTextItem('Feet', value2),
      ],
    );
  }

  Widget buildPayloadWeights(List<PayloadWeight>? payloadWeights) {
    if (payloadWeights == null || payloadWeights.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payload Weights:', style: AppTheme.currentTheme.textTheme.bodyMedium),
        ...payloadWeights.map(buildPayloadWeight).toList(),
      ],
    );
  }

  Widget buildPayloadWeight(PayloadWeight payload) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextItem('ID', payload.id),
        buildTextItem('Name', payload.name),
        buildTextItem('Kg', payload.kg),
        buildTextItem('Lb', payload.lb),
        Sizes.s.spacer(),
      ],
    );
  }

  Widget buildFirstStage(FirstStage? firstStage) {
    if (firstStage == null) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('First Stage:', style: AppTheme.currentTheme.textTheme.bodyMedium),
        buildTextItem('Reusable', firstStage.reusable),
        buildTextItem('Engines', firstStage.engines),
        buildTextItem('Fuel Amount Tons', firstStage.fuelAmountTons),
        buildTextItem('Burn Time Sec', firstStage.burnTimeSec),
        buildNestedThrust('Thrust Sea Level', firstStage.thrustSeaLevel),
        buildNestedThrust('Thrust Vacuum', firstStage.thrustVacuum),
      ],
    );
  }

  Widget buildSecondStage(SecondStage? secondStage) {
    if (secondStage == null) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Second Stage:', style: AppTheme.currentTheme.textTheme.bodyMedium),
        buildTextItem('Engines', secondStage.engines),
        buildTextItem('Fuel Amount Tons', secondStage.fuelAmountTons),
        buildTextItem('Burn Time Sec', secondStage.burnTimeSec),
        buildNestedThrust('Thrust', secondStage.thrust),
        buildTextItem('Option 1', secondStage.payloads?.option1),
        buildTextItem('Option 2', secondStage.payloads?.option2),
        buildNestedCompositeFairing(secondStage.payloads?.compositeFairing),
      ],
    );
  }

  Widget buildEngines(Engines? engines) {
    if (engines == null) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Engines:', style: AppTheme.currentTheme.textTheme.bodyMedium),
        buildTextItem('Number', engines.number),
        buildTextItem('Type', engines.type),
        buildTextItem('Version', engines.version),
        buildTextItem('Layout', engines.layout),
        buildTextItem('Engine Loss Max', engines.engineLossMax),
        buildTextItem('Propellant 1', engines.propellant1),
        buildTextItem('Propellant 2', engines.propellant2),
        buildNestedThrust('Thrust Sea Level', engines.thrustSeaLevel),
        buildNestedThrust('Thrust Vacuum', engines.thrustVacuum),
        buildTextItem('Thrust to Weight', engines.thrustToWeight),
      ],
    );
  }

  Widget buildLandingLegs(LandingLegs? landingLegs) {
    if (landingLegs == null) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Landing Legs:', style: AppTheme.currentTheme.textTheme.bodyMedium),
        buildTextItem('Number', landingLegs.number),
        buildTextItem('Material', landingLegs.material),
      ],
    );
  }

  Widget buildNestedThrust(String label, Thrust? thrust) {
    if (thrust == null) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label:', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        buildTextItem('kN', thrust.kN),
        buildTextItem('lbf', thrust.lbf),
      ],
    );
  }

  Widget buildNestedCompositeFairing(CompositeFairing? compositeFairing) {
    if (compositeFairing == null) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Composite Fairing:', style: AppTheme.currentTheme.textTheme.bodyMedium),
        buildNestedText('Height Meters', compositeFairing.height?.meters, compositeFairing.height?.feet),
        buildNestedText('Diameter Meters', compositeFairing.diameter?.meters, compositeFairing.diameter?.feet),
      ],
    );
  }
}
