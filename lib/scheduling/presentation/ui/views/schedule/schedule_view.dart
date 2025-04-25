import 'package:flutter/material.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/ui/views/schedule/widgets/my_schedule_list.dart';

import '../../../../../core/style/style.dart';
import '../../widgets/custom_text.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(33),
      child: ListView(
        shrinkWrap: true,
        children: [
          CustomText(
            'Mis Reservas',
            style: CustomTextStyles.customTextStylePoppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const MyScheduleList(),
        ],
      ),
    ));
  }
}
