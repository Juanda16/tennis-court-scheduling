import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/provider/provider.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/ui/views/home/widgets/fields.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/ui/views/home/widgets/schedule_list.dart';

import '../../../../../core/style/style.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/icon_button.dart';
import '../../widgets/main_app_bar.dart';
import '../../widgets/profile_pic.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final schedule = context.read<ScheduleProvider>();
      final fields = context.read<FieldProvider>();
      context.read<PositionProvider>().getLocation();
      fields.getFieldsFromJson();
      schedule.getItems();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        actions: [
          ProfilePic(isAsset: true, imageUrl: 'assets/images/user.png'),
          CustomIconButton(
            icon: Icon(
              Icons.notifications_none_rounded,
              color: AppColors.white,
            ),
          ),
          CustomIconButton(
            icon: Icon(
              Icons.menu,
              color: AppColors.white,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.gray.withAlpha(50),
                ),
              ),
            ),
            child: CustomText(
              "Hola, Andrea!",
              style: CustomTextStyles.customTextStylePoppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const FieldList(),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomText(
              'Reservas programadas',
              style: CustomTextStyles.customTextStylePoppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const ScheduleList(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
