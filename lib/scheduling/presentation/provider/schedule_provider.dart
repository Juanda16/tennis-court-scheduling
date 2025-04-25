import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/entities.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/book_court.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/cancel_reservation.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/get_all_reservations_use_case.dart';

class ScheduleProvider extends ChangeNotifier {
  ScheduleProvider(
    this._getAllReservationsUseCase,
    this._bookCourtUseCase,
    this._cancelReservationUseCase,
  );
  final IGetAllReservationsUseCase _getAllReservationsUseCase;
  final IBookCourtUseCase _bookCourtUseCase;
  final ICancelReservationUseCase _cancelReservationUseCase;

  List<ScheduleModel> _scheduleList = [];
  late Box<ScheduleModel> box;

  List<ScheduleModel> get scheduleList {
    return _scheduleList;
  }

  //user schedule list 'Andrea';
  List<ScheduleModel> get userScheduleList {
    return _scheduleList;
    // .where((schedule) => schedule.username.toLowerCase() == 'andrea')
    // .toList();
  }

  // Create new note
  Future<void> createItem(ScheduleModel schedule) async {
    _bookCourtUseCase.call(schedule);
    _scheduleList.add(schedule);
    getItems();
    _scheduleList.sort(
      (b, a) => a.date.compareTo(b.date),
    );
    notifyListeners();
  }

  Future<void> getItems() async {
    _scheduleList = await _getAllReservationsUseCase.call(NoParam.i);
    _scheduleList.sort(
      (b, a) => a.date.compareTo(b.date),
    );
    notifyListeners();
  }

  Future<void> deleteItem(ScheduleModel schedule) async {
    // Box<ScheduleModel> box = await Hive.openBox<ScheduleModel>(scheduleHiveBox);
    // await box.delete(schedule.key);
    await _cancelReservationUseCase.call(schedule.id);
    getItems();
  }

  bool checkIfRepeated(String field, DateTime newDate) {
    List<ScheduleModel> checkList = [];
    checkList = _scheduleList
        .where((schedule) =>
            (schedule.date == newDate) && (schedule.fieldId == field))
        .toList();

    return checkList.length >= 3;
  }
}
