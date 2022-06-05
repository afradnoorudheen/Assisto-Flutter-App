import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/theme.dart';
import '../../login/views/login_view.dart';
import '../controllers/reports_controller.dart';

class ReportsView extends GetView<ReportsController> {
  const ReportsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            Container(
              alignment: Alignment.center,
              child: AImg(
                name: 'assisto_mini',
                height: 50,
                width: 135,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFFCCD2DA),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
                Spacer(),
                Text(
                  'Reports',
                  style: Theme_.ts4s.copyWith(color: Theme_.aBlue),
                ),
                Spacer(),
              ],
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection('reports')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final docs = snapshot.data!.docs;
                        return ListView.separated(
                            separatorBuilder: ((context, index) => Divider()),
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            itemCount: docs.length,
                            itemBuilder: (c, i) {
                              return Row(
                                children: [
                                  Text(
                                    "#CUS-${docs[i].data()['phone'].toString().substring(0, 3)}",
                                    style: Theme_.ts6sGreyL,
                                  ),
                                  Spacer(),
                                  Text(
                                    '+91 ',
                                    style: Theme_.ts6l,
                                  ),
                                  Text(
                                    docs[i].data()['phone'],
                                    style: Theme_.ts6s,
                                  ),
                                  Spacer(),
                                  CircleAvatar()
                                ],
                              );
                            });
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }))
          ])),
    ));
  }
}
