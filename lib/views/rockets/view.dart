import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rockets/app/dependency_injection/injection_container.dart';
import 'package:rockets/app/router/app_router.dart';
import 'package:rockets/app/utils/logger/logger.dart';
import 'package:rockets/blocs/rockets/rockets_bloc.dart';
import 'package:rockets/views/shared_widgets/description.dart';

class RocketsView extends StatelessWidget {
  const RocketsView({super.key});

  @override
  Widget build(BuildContext context) {
    Logger.print("RocketsView - Building widget...", [LoggerFeature.rockets]);
    return Scaffold(
      appBar: AppBar(title: const Text('Rockets View')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider.value(
          value: Managers.rocketsBloc..add(FetchRockets()),
          child: BlocBuilder<RocketsBloc, RocketsState>(
            builder: (context, state) {
              Logger.print("RocketsView - BlocBuilder - State: $state", [LoggerFeature.rockets]);
              if (state is RocketsInitial) {
                return const Center(child: Text('No Rockets available.'));
              } else if (state is RocketsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is RocketsLoaded) {
                return ListView.builder(
                  itemCount: state.rockets.length,
                  itemBuilder: (context, index) {
                    final rocket = state.rockets[index];
                    return InkWell(
                      onTap: () => context.goNamed(AppRouter.rocket, pathParameters: {"id": rocket.rocketId ?? "No Rocket ID"}),
                      child: DescriptionContainer(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        header: rocket.rocketName,
                        subheader: rocket.company,
                        paragraph: [rocket.description ?? "No Description"],
                      ),
                    );
                  },
                );
              } else if (state is RocketsError) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                return const Center(child: Text('Unknown state.'));
              }
            },
          ),
        ),
      ),
    );
  }
}
