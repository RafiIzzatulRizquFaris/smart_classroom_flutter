import 'dart:convert';

import 'package:http/http.dart';
import 'package:smartclassroomflutter/constant.dart';
import 'package:smartclassroomflutter/contract/AttendContract.dart';
import 'package:smartclassroomflutter/model/AttendModel.dart';

class AttendPresenter implements AttendContractPresenter{

  AttendContractView _view;
  AttendPresenter(this._view);

  @override
  Future<List<DataBean>> getAttendance() async {
    final _url = "${Constant.baseUrl}absen";
    Client _client = Client();
    final _response = await _client.get(_url);
    if(_response.statusCode != 200){
      print("Status is not 200");
    }
    var content = json.decode(_response.body);
    List list = content['data'];
    return list.map((e) => DataBean.mapping(e)).toList();
  }

  @override
  loadData() {
    getAttendance().then((value) => _view.setAttendance(value));
  }
}