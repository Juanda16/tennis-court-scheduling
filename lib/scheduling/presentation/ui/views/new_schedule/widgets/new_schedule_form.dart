import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tennis_court_scheduling/core/i18n/generated/translations.g.dart';
import 'package:tennis_court_scheduling/core/routing/app_router.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/provider/provider.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/provider/user_provider.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/ui/views/new_schedule/widgets/time_picker.dart';

import '../../../../../../core/style/style.dart';
import '../../../../../domain/entities/entities.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'date_selector.dart';

class NewScheduleForm extends StatefulWidget {
  final CourtModel field;
  const NewScheduleForm({super.key, required this.field});

  @override
  State<NewScheduleForm> createState() => _NewScheduleFormState();
}

class _NewScheduleFormState extends State<NewScheduleForm> {
  // final TextEditingController _username = TextEditingController();
  late TextEditingController _rainProb;
  final TextEditingController _date = TextEditingController();
  final TextEditingController _timeInit = TextEditingController();
  final TextEditingController _timeEnd = TextEditingController();
  final TextEditingController _comment = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _rainProb = TextEditingController();
    _date.text = DateTime.now().toString().substring(0, 10);
  }

  @override
  void didChangeDependencies() {
    _rainProb.text = Provider.of<WeatherProvider>(
      context,
      listen: true,
    ).rainProb;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // _username.dispose();
    _rainProb.dispose();
    _date.dispose();
    _timeInit.dispose();
    _timeEnd.dispose();
    _comment.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(33),
      color: AppColors.secondaryBackgroundColor,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              translate.book_page.set_time_date,
              style: CustomTextStyles.customTextStylePoppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            dateSelector(context, _date, translate.book_page.date),
            const SizedBox(height: 10),
            CustomTextField(
              controller: _rainProb,
              hintText: translate.book_page.rain_chance,
              labelText: translate.book_page.rain_chance,
              readOnly: true,
              prefixIcon: SizedBox(
                width: 40,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.cloud_outlined,
                      color: AppColors.gray,
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: AppColors.gray.withAlpha(128),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: timePicker(
                      context, _timeInit, translate.book_page.start_time),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: timePicker(
                      context, _timeEnd, translate.book_page.end_time),
                ),
              ],
            ),
            const SizedBox(height: 30),
            CustomText(
              translate.book_page.add_comment,
              style: CustomTextStyles.customTextStylePoppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            //text area comment
            TextFormField(
              controller: _comment,
              maxLines: 5,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.lightScaffoldBackgroundColor,
                hintText: translate.book_page.add_comment,
                labelText: translate.book_page.add_comment,
                hintStyle: const TextStyle(color: Colors.grey),
                labelStyle: const TextStyle(color: Colors.grey),
                // border only bottom
                border: const UnderlineInputBorder(),
                // border all side
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: Consumer<ScheduleProvider>(
                builder: (context, scheduleService, child) => ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final date = DateTime.parse(_date.text);
                        if (!scheduleService.checkIfRepeated(
                            widget.field.id, date)) {
                          final weatherProvider = Provider.of<WeatherProvider>(
                              context,
                              listen: false);

                          scheduleService.createItem(ScheduleModel(
                              fieldName: widget.field.name ?? 'Campo',
                              fieldId: widget.field.id,
                              username: Provider.of<UserProvider>(context,
                                          listen: false)
                                      .userName ??
                                  '',
                              rainProbability: _rainProb.text,
                              date: date));
                          weatherProvider.setRainProb('');
                          GoRouter.of(context)
                              .clearStackAndNavigate('/dashboard');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text(translate.book_page.already_booked)));
                        }
                      }
                    },
                    child: Text(translate.book_page.book_now)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
