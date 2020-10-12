import 'package:flutter/material.dart';

final List<MaterialColor> lessons = [
  Colors.deepOrange,
  Colors.green,
  Colors.brown,
  Colors.indigo,
  Colors.purple,
];

class ProgrammingPlan extends StatefulWidget {
  ProgrammingPlan({Key key, this.onClick}) : super(key: key);
  final VoidCallback onClick;

  @override
  _ProgrammingPlanState createState() => _ProgrammingPlanState();
}

class _ProgrammingPlanState extends State<ProgrammingPlan> {
  var parentCount = 5;
  var childCount = 4;
  // var _direction = Axis.vertical;

  // Widget _buildParent() {
  //   var _height = 140.0;
  //   var _width = 80.0;
  //   return ListView.builder(
  //     itemBuilder: (context, index) {
  //       return Container(
  //         constraints: _direction == Axis.vertical
  //             ? BoxConstraints.tightForFinite(height: _height)
  //             : BoxConstraints.tightForFinite(width: _width),
  //         alignment: AlignmentDirectional.centerStart,
  //         child: _buildChild(index, _height, _width),
  //       );
  //     },
  //     itemCount: parentCount,
  //     scrollDirection: _direction,
  //   );
  // }

  // Widget _buildChild(parentIndex, height, width) {
  //   return ListView.builder(
  //     itemBuilder: (context, index) {
  //       var i = index % 5 + 4;
  //       i *= 100;
  //       return SizedBox(
  //         width: width,
  //         height: height,
  //         child: Container(
  //           color: _parentColors[parentIndex % 5][i],
  //           margin: EdgeInsets.all(1.0),
  //           alignment: AlignmentDirectional.center,
  //           child: Text(
  //             "$index",
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontWeight: FontWeight.w700,
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //     itemCount: childCount,
  //     scrollDirection:
  //         _direction == Axis.vertical ? Axis.horizontal : Axis.vertical,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        // add this
        textDirection: TextDirection.rtl, // set this property
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'برنامه',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
              ),
            ),
            DataColumn(
              label: Text(
                '8:00',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
              ),
            ),
            DataColumn(
              label: Text(
                '9:15',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
              ),
            ),
            DataColumn(
              label: Text(
                '10:30',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
              ),
            ),
            DataColumn(
              label: Text(
                '11:45',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
              ),
            ),
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(
                    Text('شنبه',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 10)), onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0)), //this right here
                          child: Container(
                            height: 400,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            'درس مورد نظر را انتخاب کنید'),
                                  ),
                                  Container(
                                      child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                        child: Container(
                                          child: Text(
                                            "آموزش قرآن",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        //  onTap: ,
                                      ),
                                      Text(
                                        "هدیه آسمانی",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        "فارسی",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        "نگارش فارسی",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        "ریاضی",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        "علوم تجربی",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        "مطالعات اجتماعی",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        "ضمیمه هدیه های آسمانی(ویژه اهل سنت)",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        "ضمیمه هدیه های آسمانی(ویژه اقلیت های دینی)",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(
                    Text('یکشنبه',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('دوشنبه',
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 10))),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(
                    Text('سه شنبه',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(
                    Text('چهارشنبه',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
                DataCell(
                    Text('انتخاب',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10)),
                    onTap: () {}),
              ],
            ),
          ],
        ));
  }
}
