import 'package:smartclassroomflutter/model/AttendModel.dart';

abstract class AttendContractPresenter {
  getAttendance() async {}
  loadData(){}
}

abstract class AttendContractView {
  setAttendance(List<DataBean> data) async {}
}