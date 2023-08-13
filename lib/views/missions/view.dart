import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rockets/app/dependency_injection/injection_container.dart';
import 'package:rockets/app/router/app_router.dart';
import 'package:rockets/app/utils/logger/logger.dart';
import 'package:rockets/blocs/missions/missions_bloc.dart';
import 'package:rockets/views/shared_widgets/description.dart';

class MissionsView extends StatelessWidget {
  const MissionsView({super.key});

  @override
  Widget build(BuildContext context) {
    Logger.print("MissionsView - Building widget...", [LoggerFeature.missions]);
    return Scaffold(
      appBar: AppBar(title: const Text('Missions View')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider.value(
          value: Managers.missionsBloc..add(FetchMissions()),
          child: BlocBuilder<MissionsBloc, MissionsState>(
            builder: (context, state) {
              Logger.print("MissionsView - BlocBuilder - State: $state", [LoggerFeature.missions]);
              if (state is MissionsInitial) {
                return const Center(child: Text('No missions available.'));
              } else if (state is MissionsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MissionsLoaded) {
                return ListView.builder(
                  itemCount: state.missions.length,
                  itemBuilder: (context, index) {
                    final mission = state.missions[index];
                    return InkWell(
                      onTap: () => context.goNamed(AppRouter.mission, pathParameters: {"id": mission.missionId ?? "No Mission ID"}),
                      child: DescriptionContainer(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        header: mission.missionName,
                        subheader: mission.website,
                        paragraph: [mission.description ?? "No Description"],
                      ),
                    );
                  },
                );
              } else if (state is MissionsError) {
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
