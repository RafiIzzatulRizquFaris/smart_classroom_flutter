import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartclassroomflutter/contract/AttendContract.dart';
import 'package:smartclassroomflutter/model/AttendModel.dart';
import 'package:smartclassroomflutter/presenter/AttendPresenter.dart';

class Attendance extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AttendancePage();
  }
}

class AttendancePage extends State<Attendance> implements AttendContractView {
  List<DataBean> _list = List<DataBean>();
  AttendPresenter _attendPresenter;
  var isLoading;

  AttendancePage() {
    _attendPresenter = AttendPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _attendPresenter.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Text(
                            "Attended",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "${countAttending(_list.where((element) => element.kehadiran == 0).length)}%",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Text(
                            "Truant",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "${countAttending(_list.where((element) => element.kehadiran == 1).length)}%",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Text(
                            "Permit",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "${countAttending(_list.where((element) => element.kehadiran == 2).length)}%",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      padding: EdgeInsets.all(8),
                      itemCount: _list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            title: Text(_list[index].keterangan),
                            leading: Text(_list[index].kehadiran.toString()),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  String countAttending(int note) {
    int totalStudent = _list.length;
    double operation = note * 100 / totalStudent;
    return operation.toString();
  }

  @override
  setAttendance(List<DataBean> data) async {
    if (data.isNotEmpty) {
      setState(() {
        _list = data;
        isLoading = false;
      });
    }else print("object is empty");
  }
}
