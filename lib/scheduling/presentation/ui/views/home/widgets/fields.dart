import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_court_scheduling/core/i18n/generated/translations.g.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/court_model.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/provider/provider.dart';

import '../../../../../../core/style/style.dart';
import '../../../widgets/custom_text.dart';
import 'field_card.dart';

class CourtList extends StatelessWidget {
  const CourtList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              translate.home_page.courts,
              style: CustomTextStyles.customTextStylePoppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Consumer<CourtProvider>(
              builder: (context, provider, child) {
                return SizedBox(
                  height: 360,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.fieldList.length,
                    itemBuilder: (context, index) {
                      CourtModel field = provider.fieldList[index];

                      return FieldCard(field: field);
                    },
                  ),
                );
              },
            ),
          ],
        ));
  }
}
