import 'package:assisto/app/modules/reports/views/reports_view.dart';
import 'package:assisto/app/routes/app_pages.dart';
import 'package:assisto/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../login/views/login_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  static const iconSize = 10.0;
  static const activeColor = Theme_.aBlue;
  static const inactiveColor = Theme_.greyNav;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        navBarHeight: 80,
        margin: EdgeInsets.only(bottom: 5),
        padding: NavBarPadding.only(top: 5, bottom: 15),
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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.center,
                child: AImg(
                  name: 'assisto_mini',
                  height: 70,
                  width: 155,
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
                          style: Theme_.ts1s.copyWith(
                              fontFamily: Theme_.aFontFamilyAlt,
                              fontWeight: FontWeight.w200,
                              fontSize: 35),
                        ),
                        Text(
                          controller.name,
                          style: Theme_.ts2r.copyWith(
                              fontFamily: controller.homeViewFont,
                              fontWeight: FontWeight.w800,
                              fontSize: 35),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text('Emp ID- ',
                                style: Theme_.ts6sGreyL.copyWith(
                                  fontFamily: controller.homeViewFont,
                                  color: Theme_.greyL,
                                  fontSize: 20,
                                )),
                            Text(controller.empId.toString(),
                                style: Theme_.ts6sGreyL.copyWith(
                                  fontFamily: controller.homeViewFont,
                                  color: Theme_.greyED,
                                  fontSize: 20,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/propic.png',
                    height: 120,
                    width: 120,
                  )
                ],
              ),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.ANALYSE_AUDIO),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  color: Theme_.aBlue,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
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
                              'Call a Random Customer.',
                              style: Theme_.ts6s.copyWith(
                                color: Colors.white,
                                fontFamily: controller.homeViewFont,
                                fontSize: 20,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  controller.contactCount.toString(),
                                  style: TextStyle(
                                    fontFamily: controller.homeViewFont,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  ' not contacted in database',
                                  style: Theme_.ts6r.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: controller.homeViewFont,
                                  ),
                                ),
                              ],
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
              ),
              SizedBox(
                height: 175,
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 8,
                        shadowColor: Colors.black.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AImg(
                                name: 'trophy',
                                height: 60,
                                width: 60,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Target',
                                style: Theme_.ts1s.copyWith(
                                  fontFamily: controller.homeViewFont,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '72 / 95 Completed',
                                style: Theme_.ts6sGreyL.copyWith(
                                    fontFamily: controller.homeViewFont),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Card(
                      elevation: 8,
                      shadowColor: Colors.black.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AImg(
                                  name: 'Smiley_Happy',
                                  height: 65,
                                  width: 65,
                                ),
                                Text(
                                  "Good!",
                                  style: Theme_.ts2r.copyWith(
                                    fontFamily: controller.homeViewFont,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 25,
                                    color: Theme_.green,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Reactions',
                              style: Theme_.ts1s.copyWith(
                                fontFamily: controller.homeViewFont,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'OverAll Satisfaction',
                              style: Theme_.ts6sGreyL.copyWith(
                                  fontFamily: controller.homeViewFont),
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
                shadowColor: Colors.black.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 13, 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
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
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '24 ',
                                  style: Theme_.ts4s.copyWith(
                                    fontSize: 28,
                                    color: Theme_.aBlue,
                                    fontFamily: controller.homeViewFont,
                                  ),
                                ),
                                Text(
                                  'Saved Questions',
                                  style: Theme_.ts4s.copyWith(
                                      fontFamily: controller.homeViewFont),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Refer Questions when talking to customers.',
                                    style: Theme_.ts6r.copyWith(
                                      fontWeight: FontWeight.w200,
                                      color: Colors.grey,
                                      fontFamily: controller.homeViewFont,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 70,
                              width: 150,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Color(0xFF3946B0).withOpacity(0.34),
                                //     blurRadius: 40,
                                //     offset: Offset(0, 16),
                                //   ),
                                // ],
                                borderRadius: BorderRadius.circular(19),
                                color: Theme_.aBlue,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Add \nQuestions',
                                      style: Theme_.ts5r.copyWith(
                                        color: Colors.white,
                                        fontFamily: controller.homeViewFont,
                                        fontWeight: FontWeight.w800,
                                      ),
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
                      FaIcon(
                        FontAwesomeIcons.chevronRight,
                        color: Colors.white,
                      ),
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
