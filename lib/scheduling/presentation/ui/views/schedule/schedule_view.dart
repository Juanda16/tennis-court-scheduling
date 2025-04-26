import 'package:flutter/material.dart';
import 'package:tennis_court_scheduling/core/i18n/generated/translations.g.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/ui/views/schedule/widgets/my_schedule_list.dart';

import '../../../../../core/style/style.dart';
import '../../widgets/custom_text.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        shrinkWrap: true,
        children: [
          CustomText(
            translate.book_page.my_bookings,
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
