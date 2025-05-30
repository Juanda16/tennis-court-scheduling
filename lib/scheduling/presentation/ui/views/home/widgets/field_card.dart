import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court_scheduling/core/i18n/generated/translations.g.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/entities.dart';

import '../../../../../../core/style/style.dart';
import '../../../../../../core/utils/date_utils.dart';
import '../../../widgets/custom_text.dart';

class FieldCard extends StatelessWidget {
  final CourtModel field;
  const FieldCard({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            spreadRadius: 0.5,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(field.images?.first.url ?? ''),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      field.name ?? '',
                      style: CustomTextStyles.customTextStylePoppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
                          '30%',
                          style: CustomTextStyles.customTextStylePoppins(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                CustomText(
                  field.type ?? '',
                  style: CustomTextStyles.customTextStylePoppins(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Row(
                  children: [
                    CustomText(
                      '${translate.home_page.available}: ',
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
                const SizedBox(height: 45),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          context.push('/new-schedule/${field.id}');
                        },
                        child: Text(translate.home_page.book_now)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
