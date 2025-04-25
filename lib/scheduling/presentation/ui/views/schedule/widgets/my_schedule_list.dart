import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/provider/provider.dart';

import '../../../../../domain/entities/schedule_model.dart';
import '../../../widgets/custom_text.dart';
import 'my_schedule_card.dart';

class MyScheduleList extends StatelessWidget {
  const MyScheduleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleProvider>(
      builder: (context, provider, child) {
        return provider.userScheduleList.isEmpty
            ? const Center(child: CustomText('No ha realizado reservas'))
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                itemCount: provider.userScheduleList.length,
                itemBuilder: (context, index) {
                  ScheduleModel schedule = provider.userScheduleList[index];

                  return MyScheduleCard(schedule: schedule);
                },
              );
      },
    );
  }
}
