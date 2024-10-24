import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:jotrip/app/modules/create_trip/views/planYourtrip.dart';

class MyTrip extends StatefulWidget {
  const MyTrip({super.key});

  @override
  State<MyTrip> createState() => _MyTripState();
}

class _MyTripState extends State<MyTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0XFFF6F6F6),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: const Color(0XFF56694B),
        ),
        title: const Text(
          "My Trip",
          style: TextStyle(
              color: Color(0XFF32392F),
              fontWeight: FontWeight.bold,
              fontFamily: 'SemiBold'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.ios_share),
            color: const Color(0XFF56694B),
          )
        ],
      ),
      body: Container(
        color: const Color(0XFFF6F6F6),
        child: Column(
          children: [
            const Divider(
              height: 2,
              color: Color(0XFFB2B2B2),
            ),
            const SizedBox(
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
                      boxShadow: const [
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
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Trip Dates',
                                style: TextStyle(
                                    fontFamily: 'SemiBold',
                                    color: Color(0XFF70846E),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color(0XFF4F832D)
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(30)),
                                padding: const EdgeInsets.all(10),
                                child: const Text(
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
                                  image: const DecorationImage(
                                    image: AssetImage('assets/taj_mahal.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const SizedBox(
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
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
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
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '8 Days agra trip plan..',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF1E4E01),
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    Icons.people_alt_outlined,
                                    size: 20,
                                    color: const Color(0xff00000000)
                                        .withOpacity(0.4),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '8 People',
                                    style: TextStyle(
                                      color: const Color(0xff00000000)
                                          .withOpacity(0.55),
                                      fontFamily: "Medium",
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0XFF77AB00),
                                  const Color(0XFF80B900).withOpacity(0.71),
                                  const Color(0XFF72A400),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Get.to(const PlanYourTrip());
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
//
// Widget planYourtrip() {
//   return Scaffold(
//     appBar: AppBar(
//       leading: Expanded(
//         child: Container(
//           width: 40,
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.arrow_back_ios_new),
//                 color: Color(0xFF56694B),
//                 onPressed: () {
//                   // Back action
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       title: Center(
//         child: Text(
//           'Plan Your Trip',
//           style: TextStyle(
//             color: Color(0xFF32392F),
//             fontFamily: "Semibold",
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.ios_share),
//           color: Color(0xFF56694B),
//           onPressed: () {
//             // Share action
//           },
//         ),
//       ],
//       backgroundColor: Color(0xFFFFFFFF).withOpacity(0.85),
//     ),
//     body: Stack(
//       children: [
//         Column(
//           children: [
//             // Top Image with Taj Mahal
//             Container(
//               height: MediaQuery.of(context).size.height * 0.4,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(
//                       'https://s3-alpha-sig.figma.com/img/3188/7e63/bfdbed415cbce224902dd890043e5e98?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Ygu49SH5Ccx6abGOCwwl6M8xBC4-xQ0Es8-r~KSZuFtz9Ou~U54Tl4yn8zaKFN6Dx5N-~p7gcp0XDZpWhdp78YoVqn-ottvnMNy3vmNhsUNZZ6qh1Gc57J-DGxIDbYFTrRXMpBD8-HblOZz034qbhOg3W0X4~xRpxm0pqdL~BmtNT1MVU5OpZUh0kJs3yRQvF4PV9RwBFdlv~Boi5CF4OQfqrZGV62ixIBTBw4jiZER9vWy8mUv0steXNAxiYOxEfErTPmoOaSsdwdmshcxenbAFsTXc8WjjS0WW2AlXj2VK-ddQKSj4bch9QoqoYoTnwZmAorjST4dd-nFwGbOonQ__'), // Taj Mahal image
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//
//             // Add space below the image
//             SizedBox(height: 20),
//
//             // Trip details section
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Card(
//                       color: Color(0xFFFFFFFF),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(height: 8),
//                             Obx(() => Text(
//                                   "",
//                                   style: TextStyle(
//                                     fontSize: 21,
//                                     fontFamily: "Semibold",
//                                     fontWeight: FontWeight.bold,
//                                     color: Color(0xFF32392F),
//                                   ),
//                                 )),
//                             SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 Icon(Icons.calendar_today,
//                                     size: 20,
//                                     color:
//                                         Color(0xFF000000).withOpacity(0.55)),
//                                 SizedBox(width: 8),
//                                 Obx(() => Text("",
//                                     style: TextStyle(
//                                         fontFamily: "Regular",
//                                         color: Color(0xFF555555)
//                                             .withOpacity(0.85)))),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//
//                             // Your Budget with icon
//                             Row(
//                               children: [
//                                 Icon(Icons.account_balance_wallet_outlined,
//                                     size: 20,
//                                     color:
//                                         Color(0xFF000000).withOpacity(0.55)),
//                                 SizedBox(width: 8),
//                                 Obx(() => Text('',
//                                     style: TextStyle(
//                                         fontFamily: "Regular",
//                                         color: Color(0xFF555555)
//                                             .withOpacity(0.85)))),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//
//                             // Location with icon
//                             Row(
//                               children: [
//                                 Icon(Icons.location_on_outlined,
//                                     size: 20,
//                                     color:
//                                         Color(0xFF000000).withOpacity(0.55)),
//                                 SizedBox(width: 8),
//                                 Obx(() => Text("",
//                                     style: TextStyle(
//                                         fontFamily: "Regular",
//                                         color: Color(0xFF555555)
//                                             .withOpacity(0.85)))),
//                               ],
//                             ),
//                             SizedBox(height: 8),
//
//                             // People with icon
//                             Row(
//                               children: [
//                                 Icon(Icons.people_alt_outlined,
//                                     size: 20,
//                                     color:
//                                         Color(0xFF000000).withOpacity(0.55)),
//                                 SizedBox(width: 8),
//                                 Obx(() => Text("",
//                                     style: TextStyle(
//                                         fontFamily: "Regular",
//                                         color: Color(0xFF555555)
//                                             .withOpacity(0.85)))),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // New Card for Description
//             SizedBox(height: 10), // Space between the two cards
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Card(
//                 color: Color(0xFFFFFFFF),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'description',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontFamily: "Medium",
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         'Agra is renowned for the Taj Mahal and Agra Fort, offering a rich glimpse into Mughal history and architecture.',
//                         style: TextStyle(
//                             fontSize: 16,
//                             fontFamily: "Regular",
//                             color: Color(0xFF555555).withOpacity(0.85)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//
//         // See Trip Overview Button (fixed at the bottom)
//         Positioned(
//           bottom: 20,
//           left: 16,
//           right: 16,
//           child: ElevatedButton(
//             onPressed: () {
//               // Your button action here
//
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color(0xFF4F832D), // Button color
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(35), // Rounded corners
//               ),
//               padding:
//                   EdgeInsets.symmetric(vertical: 16), // Adjust button height
//             ),
//             child: Text(
//               'See Trip Overview',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontFamily: "Medium",
//                 color: Color(0xFFFFFFFF),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
}
