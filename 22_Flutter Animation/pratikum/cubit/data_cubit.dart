import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/data_contact.dart';
import 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(const DataState(list: [])) {
    ambilData();
  }

  final List<DataContact> listItem = [];

  void ambilData() async {
    emit(DataState(list: listItem));
  }

  void tambahData(DataContact contactsModel) async {
    listItem.add(contactsModel);
    emit(DataState(list: listItem));
  }
}
