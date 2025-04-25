import 'package:flutter/material.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/court_model.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/no_param.dart';
import 'package:tennis_court_scheduling/scheduling/domain/use_cases/get_all_courts.dart';

class FieldProvider extends ChangeNotifier {
  FieldProvider(this._getAllCourtsUseCase);
  final IGetAllCourtsUseCase _getAllCourtsUseCase;

  CourtModel _selected = CourtModel(id: '1');
  void selectField(CourtModel field) {
    _selected = field;
    notifyListeners();
  }

  CourtModel get selectedField {
    return _selected;
  }

  final List<CourtModel> _items = [];

  List<CourtModel> get fieldList {
    return _items;
  }

  void fillFieldList(List<CourtModel> items) {
    _items.clear();
    _items.addAll(items);
    notifyListeners();
  }

  Future<void> getFieldsFromJson() async {
    List<CourtModel> fields = await _getAllCourtsUseCase.call(NoParam.i);
    fillFieldList(fields);
  }
}
