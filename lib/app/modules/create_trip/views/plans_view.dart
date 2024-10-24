import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'plan_details.dart';

class AIPlanGeneratedResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFF6F6F6),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0XFF56694B)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'AI Generated Trips',
          style: TextStyle(
            fontFamily: 'SemiBold',
            color: Color(0XFF32392F),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.ios_share,color: Color(0XFF56694B),))
        ],
        centerTitle: true,
      ),

      body: Container(
        color: Color(0XFFF6F6F6),
        child: Column(
          children: [
            Divider(
              height: 2,
              color: Color(0XFFB2B2B2),
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Trip Dates',
                                style: TextStyle(
                                    fontFamily: 'SemiBold',
                                    color: Color(0XFF70846E),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0XFF4F832D).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(30)),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  '15 Oct - 20 Oct',
                                  style: TextStyle(
                                      color: Color(0XFF4F832D),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Medium'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                height: 280,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/taj_mahal.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 275),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '8 Days agra trip plan..',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF1E4E01),
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    Icons.people_alt_outlined,
                                    size: 20,
                                    color: Color(0XFF00000000).withOpacity(0.4),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '8 People',
                                    style: TextStyle(
                                      color:
                                      Color(0XFF00000000).withOpacity(0.55),
                                      fontFamily: "Medium",
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0XFF77AB00),
                                  Color(0XFF80B900).withOpacity(0.71),
                                  Color(0XFF72A400),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Get.to(EditablePlanDetailsScreen());
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text('Trip Details',
                                  style: TextStyle(color: Color(0XFFFFFFFF))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }

  // // Card Widget for each tour plan
  // Widget _buildPlanCard(BuildContext context,
  //     {required String label,
  //     required String title,
  //     required String location,
  //     required String dateRange,
  //     required String people,
  //     required String budget,
  //     required Color labelColor}) {
  //   return Card(
  //     margin: EdgeInsets.symmetric(vertical: 8),
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  //     child: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           // Label (e.g., MOST POPULAR, MOST AFFORDABLE)
  //           Container(
  //             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
  //             decoration: BoxDecoration(
  //               color: labelColor.withOpacity(0.2),
  //               borderRadius: BorderRadius.circular(15),
  //             ),
  //             child: Text(
  //               label,
  //               style: TextStyle(
  //                 fontSize: 12,
  //                 color: labelColor,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //           SizedBox(height: 8),
  //
  //           // Title
  //           Text(
  //             title,
  //             style: TextStyle(
  //               fontSize: 18,
  //               fontWeight: FontWeight.bold,
  //               color: Colors.black,
  //             ),
  //           ),
  //           SizedBox(height: 8),
  //
  //           // Location and Dates
  //           Row(
  //             children: [
  //               Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
  //               SizedBox(width: 4),
  //               Text(
  //                 location,
  //                 style: TextStyle(
  //                   fontSize: 14,
  //                   color: Colors.grey[700],
  //                 ),
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 4),
  //           Row(
  //             children: [
  //               Icon(Icons.calendar_today_outlined,
  //                   size: 16, color: Colors.grey),
  //               SizedBox(width: 4),
  //               Text(
  //                 dateRange,
  //                 style: TextStyle(
  //                   fontSize: 14,
  //                   color: Colors.grey[700],
  //                 ),
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 4),
  //           Row(
  //             children: [
  //               Icon(Icons.group_outlined, size: 16, color: Colors.grey),
  //               SizedBox(width: 4),
  //               Text(
  //                 people,
  //                 style: TextStyle(
  //                   fontSize: 14,
  //                   color: Colors.grey[700],
  //                 ),
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 12),
  //
  //           // Budget and "See Details" Button
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     'Budget estimation',
  //                     style: TextStyle(fontSize: 12, color: Colors.grey[500]),
  //                   ),
  //                   Text(
  //                     budget,
  //                     style: TextStyle(
  //                       fontSize: 18,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               ElevatedButton(
  //                 onPressed: () {
  //                   Get.to(EditablePlanDetailsScreen());
  //                   // Handle See Details action
  //                 },
  //                 style: ElevatedButton.styleFrom(
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(30),
  //                   ),
  //                   backgroundColor:
  //                       Colors.blueAccent, // Updated: Button background color
  //                   padding: EdgeInsets.symmetric(
  //                       horizontal: 24,
  //                       vertical: 12), // Optional: Adjust padding
  //                 ),
  //                 child: Text(
  //                   'See Details',
  //                   style: TextStyle(color: Colors.white), // Text color
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
