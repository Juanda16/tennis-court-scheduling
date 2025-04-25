import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/provider/provider.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/ui/views/home/widgets/schedule_card.dart';

import '../../../../../domain/entities/schedule_model.dart';
import '../../../widgets/custom_text.dart';

class ScheduleList extends StatelessWidget {
  const ScheduleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleProvider>(
      builder: (context, provider, child) {
        return provider.scheduleList.isEmpty
            ? const Center(child: CustomText('No se han realizado reservas'))
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                itemCount: provider.scheduleList.length,
                itemBuilder: (context, index) {
                  ScheduleModel schedule = provider.scheduleList[index];

                  return ScheduleCard(schedule: schedule);
                },
              );
      },
    );
  }
}
