import 'package:activityapp/constants.dart';
import 'package:activityapp/screens/map_screen.dart';
import 'package:activityapp/widgets/weekly_chart.dart';
import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_clipper.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = 'Week';
  bool selectedTrackerType = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.pink.withOpacity(0.9),
                      Colors.pink.withOpacity(0.7),
                      Colors.purple.withOpacity(0.8),
                      Colors.purple,
                    ],
                    begin: Alignment.topLeft,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    right: 20,
                    bottom: 10,
                  ),
                  child: Column(
                    children: [
                      // App Bar row
                      buildAppBarWithBack(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            // Profile Image
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.purple.withOpacity(0.3),
                                    Colors.purpleAccent.withOpacity(0.3),
                                  ],
                                  begin: Alignment.topCenter,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(
                                    'assets/images/profile_pic.jpeg'),
                              ),
                            ),
                            SizedBox(width: 20),
                            // Profile Name and location
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mia Smith',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Houston, TX',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildActivityInfo(
                              title: 'total distance, mi',
                              activityCount: '800',
                            ),
                            SizedBox(
                              child: Container(
                                width: 1,
                                height: 25,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                            buildActivityInfo(
                              title: 'total steps',
                              activityCount: '105k',
                            ),
                            SizedBox(
                              child: Container(
                                width: 1,
                                height: 25,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                            buildActivityInfo(
                              title: 'total calories, kcal',
                              activityCount: '3.8k',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  children: [
                    // Total Activity and drop down
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total activity',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200,
                          ),
                          child: buildActivityDurationDropDown(),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        buildActivityTrackerType(
                            title: 'Steps', onPress: () {}, isSelected: true),
                        SizedBox(width: 15),
                        buildActivityTrackerType(
                          title: 'Calories',
                          onPress: () {},
                          isSelected: false,
                        ),
                        SizedBox(width: 15),
                        buildActivityTrackerType(
                          title: 'Distance',
                          onPress: () {},
                          isSelected: false,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    WeeklyChart(),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Goals',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200,
                          ),
                          child: buildActivityDurationDropDown(),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    buildActivityTypeStatus(
                      title: 'Running',
                      timeCompleted: '30',
                      totalTime: '180',
                      colorName: Colors.purple,
                      completedSteps: 2,
                    ),
                    SizedBox(height: 20),
                    buildActivityTypeStatus(
                      title: 'Pilates',
                      timeCompleted: '60',
                      totalTime: '120',
                      colorName: Colors.red.shade700,
                      completedSteps: 5,
                    ),
                    SizedBox(height: 20),
                    buildActivityTypeStatus(
                      title: 'Yoga',
                      timeCompleted: '90',
                      totalTime: '120',
                      colorName: Colors.deepPurple.shade700,
                      completedSteps: 8,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buildActivityTypeStatus(
      {String title,
      String timeCompleted,
      String totalTime,
      Color colorName,
      int completedSteps}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: colorName,
                fontWeight: FontWeight.w600,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$timeCompleted / ',
                    style: TextStyle(
                      color: colorName,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: '$totalTime min',
                    style: TextStyle(
                      color: kTextLightColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        StepProgressIndicator(
          totalSteps: 10,
          currentStep: completedSteps,
          selectedColor: colorName,
          unselectedColor: kInactiveChartColor,
          roundedEdges: Radius.circular(10),
          size: 10,
        ),
      ],
    );
  }

  DropdownButton<String> buildActivityDurationDropDown() {
    return DropdownButton<String>(
      value: dropdownValue,
      isDense: false,
      icon: Icon(
        Icons.arrow_drop_down,
        color: Colors.purple,
      ),
      iconSize: 24,
      elevation: 5,
      style: TextStyle(color: Colors.purple),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: [
        'Week',
        'Month',
        'Year',
      ].map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
    );
  }

  GestureDetector buildActivityTrackerType(
      {String title, Function onPress, bool isSelected}) {
    return GestureDetector(
      onTap: onPress,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isSelected == true ? Colors.purple : kTextLightColor,
        ),
      ),
    );
  }

  RichText buildActivityInfo({String title, String activityCount}) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: '$activityCount\n',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          TextSpan(
            text: title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }

  Widget buildAppBarWithBack() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MapScreen();
            }));
          },
          child: Container(
            height: 30,
            child: ClipPolygon(
              rotate: 90,
              sides: 6,
              borderRadius: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
