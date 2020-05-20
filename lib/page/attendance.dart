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
  var someString = "";
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
                      child: Text(
                        someString,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
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
                      child: Text(
                        "Truant",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
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
                      child: Text(
                        "Permit",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
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

  @override
  setAttendance(List<DataBean> data) async {
    if (data.isEmpty) {
      print("object is empty");
    } else {
      setState(() {
        _list = data;
        someString = _list[0].keterangan;
        isLoading = false;
      });
    }
  }
}
