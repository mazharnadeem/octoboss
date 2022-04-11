import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:octbs_ui/Model/IssuesModel.dart';
import 'package:octbs_ui/controller/api/userDetails.dart';
// import 'package:octbs_ui/Model/issuemodel.dart';
// import 'package:octbs_ui/Model/issuemodel.dart';
import 'package:octbs_ui/screens/users/Customer/add_issue_screen.dart';

class issueList {
  int? response;
  int? code;
  List<Data>? data;

  issueList({this.response, this.code, this.data});

  issueList.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? title;
  String? description;
  String? status;
  String? image;
  String? languages;
  String? createdBy;
  String? createdAt;
  List<History>? history;

  Data(
      {this.id,
        this.title,
        this.description,
        this.status,
        this.image,
        this.languages,
        this.createdBy,
        this.createdAt,
        this.history});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    image = json['image'];
    languages = json['languages'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    if (json['history'] != null) {
      history = <History>[];
      json['history'].forEach((v) {
        history!.add(new History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['image'] = this.image;
    data['languages'] = this.languages;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    if (this.history != null) {
      data['history'] = this.history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class History {
  String? id;
  String? issueId;
  String? status;
  String? userId;
  String? date;

  History({this.id, this.issueId, this.status, this.userId, this.date});

  History.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    issueId = json['issue_id'];
    status = json['status'];
    userId = json['user_id'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['issue_id'] = this.issueId;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['date'] = this.date;
    return data;
  }
}


class IssueListDone extends StatefulWidget {
  IssueListDone({Key? key}) : super(key: key);

  @override
  State<IssueListDone> createState() => _IssueListDoneState();
}

class _IssueListDoneState extends State<IssueListDone> {
  Future<issueList> getPostApi_processing() async {

    final response = await http.get(
        Uri.parse("https://admin.noqta-market.com/new/API/IssuesList.php"));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 201) {
      issue_details=data['data'];
      var x=user_details['data']['id'];
      var len=data['data'].length-1;
      print('Length of data : $len');
      var y;
      var ind=0;
      var ls=[];
      abc_done.clear();
      // var abc_done=[];
      // data['data'].contains('');
      // var data4= data.where((data) => (data['created_by'].contains(73.toString())));

      // print('Data Value is\n ${data['data'][10]['created_by']}');
      // print('Mazhar Data\n${data['data'].length}');
      for(int i=0;len>=i;i++){
        print('I value is :$i');

        var che=data['data'][i]['status'];
        print('Processing check: ');
        setState(() {

        });
        if(che=='done')
          // var w=jsonDecode(data['data'][0]);
            {
          // print('Processing Check');
          if (i <= len) {
            if (x == data['data'][i]['created_by']) {
              y = data['data'][i];
              abc_done.add(y);
              // sorted_issue=sorted_issue.addAll(y);
              print('\nData Runtype ${y.runtimeType}');
              // ls[ind]=y;
              // sorted_issue.push(y);
              // print('Mazhar sorted');
            }
            // print('New value $i : ${}');
          }
        }
        // print("List Length ${y.length}");


        // y=data['data']['$i'][i]['created_by'];
        // print('i Value is : $i');
        // if(x==y){
        //   // sorted_issue=sorted_issue.add(data['data'][i]);
        //   print('Sorted Array');
        //   print('${data['data'][i.toString()]}');
        //   // sorted_issue.add(jsonEncode(data['data'][i]));
      }
      // print('abc_done Testing :  ${abc_done[1]['title']}');
      // print('\nPakistan : ${y}\n');
      // }
      // Fluttertoast.showToast(msg: msg)
      print('Processing Length: ${abc_done.length}');
      // print('Sorted List \n $sorted_issue');
      return issueList.fromJson(data);
    } else {
      print('Processing Failed');
      return issueList.fromJson(data);
    }
  }

  // Future<IssuesModel> get_Issues() async{
  //   final response=await http.get(Uri.parse('https://admin.noqta-market.com/new/API/IssuesList.php'));
  //   var data=jsonDecode(response.body.toString());
  //   if(response.statusCode==200){
  //     return IssuesModel.fromJson(data);
  //   }
  //   else{
  //     return IssuesModel.fromJson(data);
  //   }
  // }
  var status;

  late Future<issueList> futureList;
  @override
  void initState() {
    super.initState();
    // futureList = getPostApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<issueList>(
                  future: getPostApi_processing(),
                  builder: (context,AsyncSnapshot snapshot) {
                    if(snapshot.data!=null){
                      return ListView.builder(
                        itemCount: abc_done.length,
                        itemBuilder: (context, index) {
                          status=checkValue(abc_done[index]['issue_type']);
                          print('Status Value : $status');

                          if(snapshot.hasData){
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, top: 8),
                              child: Card(
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisSize:MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: NetworkImage(abc_done[index]['image']),
                                                  radius: 35,
                                                  backgroundColor: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(abc_done[index]['title']),
                                                  Text(abc_done[index]['status']),
                                                  Text(abc_done[index]['description']),
                                                  Text(abc_done[index]['languages']),
                                                  // Text(snapshot
                                                  //     .data.data[index].status
                                                  //     .toString()),
                                                  // Text(snapshot
                                                  //     .data.data[index].description
                                                  //     .toString()),
                                                  // Text(snapshot
                                                  //     .data.data[index].languages
                                                  //     .toString()),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Column(
                                              children: [
                                                Text('Public Issue'),
                                                Container(
                                                  child: FlutterSwitch(
                                                    width: 105.0,
                                                    height: 35.0,
                                                    valueFontSize: 15.0,
                                                    toggleSize: 45.0,
                                                    value: status,
                                                    borderRadius: 30.0,
                                                    padding: 8.0,
                                                    activeColor: Colors.orange,
                                                    showOnOff: true,
                                                    onToggle: (val) {
                                                      setState(() {
                                                        if(val){
                                                          status=val;
                                                        }
                                                        else{
                                                          status=true;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                            );
                          }
                          else{
                            return CircularProgressIndicator();
                          }

                        },
                      );
                    }
                    else{
                      return Center(child: CircularProgressIndicator());
                    }

                  })),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => CustomerAddIssueScreen()));
            },
            child: Card(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                  Spacer(),
                  Text(
                    'Add New Issue',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  // IconButton(onPressed: () {}, icon: Icon(Icons.add))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  checkValue(var value) {
    if(value=='public'){
      return true;
    }
    else{
      return false;
    }
  }
}
