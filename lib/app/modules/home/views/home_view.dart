import 'package:assisto/app/modules/reports/views/reports_view.dart';
import 'package:assisto/app/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../login/views/login_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  static const iconSize = 10.0;
  static const activeColor = Theme_.aBlue;
  static const inactiveColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        navBarHeight: 70,
        margin: EdgeInsets.only(bottom: 5),
        padding: NavBarPadding.only(top: 5, bottom: 5),
        decoration: NavBarDecoration(boxShadow: [
          BoxShadow(
              color: Color(0xFF4F5565).withOpacity(0.1),
              blurRadius: 6,
              offset: Offset(0, -2))
        ], borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        navBarStyle: NavBarStyle.style12,
        items: [
          PersistentBottomNavBarItem(
              activeColorPrimary: activeColor,
              inactiveColorPrimary: inactiveColor,
              iconSize: iconSize,
              inactiveIcon: _buildNavIcon(inactiveColor, 'home', 'Home'),
              icon: _buildNavIcon(activeColor, 'home', "Home"),
              title: 'Home'),
          PersistentBottomNavBarItem(
              contentPadding: 10,
              activeColorPrimary: activeColor,
              inactiveColorPrimary: inactiveColor,
              iconSize: iconSize,
              inactiveIcon:
                  _buildNavIcon(inactiveColor, 'contscts', 'Contacts'),
              icon: _buildNavIcon(activeColor, 'contscts', "Contacts"),
              title: 'Contacts'),
          PersistentBottomNavBarItem(
              activeColorPrimary: activeColor,
              inactiveColorPrimary: inactiveColor,
              inactiveIcon: _buildNavIcon(inactiveColor, 'reports', 'Reports'),
              icon: _buildNavIcon(activeColor, 'reports', "Reports"),
              title: 'Reports'),
          PersistentBottomNavBarItem(
              activeColorPrimary: activeColor,
              inactiveColorPrimary: inactiveColor,
              iconSize: iconSize,
              inactiveIcon: _buildNavIcon(inactiveColor, 'profile', 'Profile'),
              icon: _buildNavIcon(activeColor, 'profile', "Profile"),
              title: 'Profile')
        ],
        screens: [buildHome(), Container(), ReportsView(), Container()],
      ),
    );
  }

  Column _buildNavIcon(Color color, String iconName, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AImg(
          name: iconName,
          color: color,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: Theme_.ts6s.copyWith(color: color),
        )
      ],
    );
  }

  Scaffold buildHome() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.center,
                child: AImg(
                  name: 'assisto_mini',
                  height: 50,
                  width: 135,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hey!',
                          style:
                              Theme_.ts2r.copyWith(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Joy Mathey',
                          style:
                              Theme_.ts2r.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text('Emp ID-82789', style: Theme_.ts6sGreyL)
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/propic.png',
                    height: 100,
                    width: 100,
                  )
                ],
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Theme_.aBlue,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.phone),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Call a Random Customer',
                            style: Theme_.ts6s.copyWith(color: Colors.white),
                          ),
                          Text(
                            '172 not contacted in database',
                            style: Theme_.ts6r.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 175,
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 8,
                        shadowColor: Colors.black26,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AImg(
                                name: 'trophy',
                                height: 50,
                                width: 50,
                              ),
                              Text(
                                'Target',
                                style: Theme_.ts1s,
                              ),
                              Text(
                                '72/95 Completed',
                                style: Theme_.ts6sGreyL
                                    .copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Card(
                      elevation: 8,
                      shadowColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AImg(
                              name: 'trophy',
                              height: 50,
                              width: 50,
                            ),
                            Text(
                              'Reactions',
                              style: Theme_.ts1s,
                            ),
                            Text(
                              'OverAll Satisfaction',
                              style: Theme_.ts6sGreyL
                                  .copyWith(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              Card(
                elevation: 8,
                shadowColor: Colors.black26,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AImg(
                          name: 'question',
                          height: 40,
                          width: 40,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '24 ',
                                  style: Theme_.ts4s.copyWith(
                                      fontSize: 28,
                                      color: Theme_.aBlue,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Saved Questions',
                                  style: Theme_.ts4s
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Refer Questions when talking to customers',
                                    style: Theme_.ts6r.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: 175,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF3946B0).withOpacity(0.34),
                                    blurRadius: 40,
                                    offset: Offset(0, 16),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(19),
                                color: Theme_.aBlue,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Add Question',
                                      style: Theme_.ts5r
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
