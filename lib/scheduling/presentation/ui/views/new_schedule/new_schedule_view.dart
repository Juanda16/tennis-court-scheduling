import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_court_scheduling/core/i18n/generated/translations.g.dart';
import 'package:tennis_court_scheduling/core/style/style.dart'
    show AppColors, CustomTextStyles;
import 'package:tennis_court_scheduling/core/utils/date_utils.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/entities.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/provider/provider.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/ui/views/new_schedule/widgets/carousel_slider.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/ui/views/new_schedule/widgets/new_schedule_form.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/ui/widgets/custom_text.dart';

class NewScheduleView extends StatelessWidget {
  final CourtModel field;
  const NewScheduleView({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FieldCarousel(images: field.images ?? []),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        field.name ?? '',
                        style: CustomTextStyles.customTextStylePoppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomText(
                        '\$${field.price ?? ''}',
                        style: CustomTextStyles.customTextStylePoppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  // type  | por hora
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        field.type ?? '',
                        style: CustomTextStyles.customTextStylePoppins(
                          fontSize: 14,
                          color: AppColors.black,
                        ),
                      ),
                      CustomText(
                        translate.book_page.per_hour,
                        style: CustomTextStyles.customTextStylePoppins(
                          fontSize: 14,
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      CustomText(
                        "${translate.book_page.available}: ",
                        style: CustomTextStyles.customTextStylePoppins(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      CustomText(
                        getTimeFromString(field.availableFrom ?? ''),
                        style: CustomTextStyles.customTextStylePoppins(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(width: 5),
                      CustomText(
                        '-',
                        style: CustomTextStyles.customTextStylePoppins(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(width: 5),
                      CustomText(
                        getTimeFromString(field.availableTo ?? ''),
                        style: CustomTextStyles.customTextStylePoppins(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  // current location
                  Consumer<PositionProvider>(
                    builder: (context, positionProvider, child) {
                      return Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: AppColors.gray,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: CustomText(
                              positionProvider.address ?? '',
                              style: CustomTextStyles.customTextStylePoppins(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            NewScheduleForm(
              field: field,
            ),
          ],
        ),
      ),
    );
  }
}
