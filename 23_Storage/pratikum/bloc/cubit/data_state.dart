import '../model/data_contact.dart';

class DataState {
  final List<DataContact> list;
  const DataState({required this.list});

  List<Object> get props => [list];
}
