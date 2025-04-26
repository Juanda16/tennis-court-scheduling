import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/provider/provider.dart';

import '../../../../../../core/style/style.dart';
import '../../../../../../core/utils/date_utils.dart';
import '../../../../../domain/entities/schedule_model.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/profile_pic.dart';

class MyScheduleCard extends StatelessWidget {
  final ScheduleModel schedule;
  const MyScheduleCard({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.lightScaffoldBackgroundColor,
        border: Border.all(
          color: AppColors.gray.withAlpha(128),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/field-1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      schedule.fieldName,
                      style: CustomTextStyles.customTextStylePoppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    //delete button
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.delete, color: AppColors.red),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: CustomText('Eliminar Reserva',
                                    style:
                                        CustomTextStyles.customTextStylePoppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                content: const CustomText(
                                    '¿Estás seguro que deseas eliminar esta reserva?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      //delete schedule
                                      // schedule provider
                                      final scheduleService =
                                          Provider.of<ScheduleProvider>(context,
                                              listen: false);
                                      scheduleService.deleteItem(schedule);
                                      //close dialog
                                      Navigator.of(context).pop();
                                    },
                                    child: CustomText('Eliminar',
                                        style: CustomTextStyles
                                            .customTextStylePoppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.red)),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      //close dialog

                                      Navigator.of(context).pop();
                                    },
                                    child: const CustomText('Cancelar'),
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: AppColors.gray,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    CustomText(getFormattedDate(schedule.date),
                        style: CustomTextStyles.customTextStylePoppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
                Row(
                  children: [
                    CustomText(
                      'Reservado por:',
                      style: CustomTextStyles.customTextStylePoppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const ProfilePic(
                        isAsset: true, imageUrl: 'assets/images/user.png'),
                    const SizedBox(width: 5),
                    CustomText(schedule.username,
                        style: CustomTextStyles.customTextStylePoppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),

                const SizedBox(height: 10),
                // 2 horas / price by hour
                IntrinsicHeight(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: AppColors.gray,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      CustomText(
                        '2 horas',
                        style: CustomTextStyles.customTextStylePoppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const VerticalDivider(
                        color: AppColors.gray,
                        thickness: 1,
                        width: 20,
                      ),
                      const SizedBox(width: 5),
                      CustomText(
                        '\$50',
                        style: CustomTextStyles.customTextStylePoppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                //rain probability
                Row(
                  children: [
                    const Icon(
                      Icons.cloudy_snowing,
                      color: Colors.blue,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    CustomText(
                      schedule.rainProbability,
                      style: CustomTextStyles.customTextStylePoppins(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
