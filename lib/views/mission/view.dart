import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rockets/app/dependency_injection/injection_container.dart';
import 'package:rockets/app/utils/sizes/edge_insets.dart';
import 'package:rockets/app/utils/sizes/spacers.dart';
import 'package:rockets/app/theme/app_theme.dart';
import 'package:rockets/blocs/mission/mission_bloc.dart';

class MissionView extends StatelessWidget {
  final String id;
  const MissionView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mission Details'),
      ),
      body: Padding(
        padding: AppEdgeInsets.all(context, Sizes.m),
        child: BlocProvider<MissionBloc>.value(
          value: Managers.missionBloc..add(FetchMission(id)),
          child: BlocBuilder<MissionBloc, MissionState>(
            builder: (context, state) {
              if (state is MissionLoaded) {
                final missionData = state.mission;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        missionData.missionName ?? 'No Mission Name',
                        style: AppTheme.currentTheme.textTheme.titleLarge,
                      ),
                      Sizes.s.spacer(),
                      Text(missionData.description ?? 'No Description', style: AppTheme.currentTheme.textTheme.bodyMedium),
                      Sizes.m.spacer(),
                      Text(
                        'Manufacturers:',
                        style: AppTheme.currentTheme.textTheme.titleLarge,
                      ),
                      Text(
                        (missionData.manufacturers?.join(', ') ?? 'No Manufacturers'),
                        style: AppTheme.currentTheme.textTheme.bodyMedium,
                      ),
                      Sizes.m.spacer(),
                      Text(
                        'Payload IDs:',
                        style: AppTheme.currentTheme.textTheme.titleLarge,
                      ),
                      Column(
                        children: (missionData.payloadIds?.map<Widget>((payload) {
                              return Text(
                                '- $payload',
                                style: AppTheme.currentTheme.textTheme.bodyMedium,
                              );
                            }).toList() ??
                            [const Text('No Payload IDs')]),
                      ),
                      Sizes.m.spacer(),
                      Text(
                        'Website:',
                        style: AppTheme.currentTheme.textTheme.titleLarge,
                      ),
                      Text(
                        missionData.website ?? 'No Website',
                        style: AppTheme.currentTheme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                );
              } else if (state is MissionsError) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
