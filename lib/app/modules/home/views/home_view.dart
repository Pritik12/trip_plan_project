import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF6F6F6),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Background and Header
            Stack(
              children: [
                Container(
                  height: 440,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/scenery.png'),
                      // Background image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 140.0),
                    child: Text(
                      'Travel Smart,\'\nPlan Effortlessly',
                      style: TextStyle(
                        fontFamily: 'SemiBold',
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E2E2E),
                      ),
                    ),
                  ),
                ),

                // Search Box

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 410),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Color(0XFF4F832D),
                            size: 40,
                          ),
                          onPressed: () {
                            //code here
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Where to?',
                              style: TextStyle(
                                  color: Color(0XFF1E4E01),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: 'Medium'),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Anywhere',
                                  style: TextStyle(
                                      color: const Color(0xff00000000)
                                          .withOpacity(0.55),
                                      fontFamily: 'Regular'),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  'Any week',
                                  style: TextStyle(
                                    color: const Color(0xff00000000)
                                        .withOpacity(0.55),
                                    fontFamily: 'Regular',
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  'Add people',
                                  style: TextStyle(
                                    color: const Color(0xff00000000)
                                        .withOpacity(0.55),
                                    fontFamily: 'Regular',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Categories Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Icon(
                        Icons.flight_takeoff,
                        color: Color(0XFF74A103),
                        size: 28,
                      ),
                      Text(
                        "Flights",
                        style: TextStyle(
                            color: Color(0XFF74A103), fontFamily: 'Regular'),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.hotel_outlined,
                        color: const Color(0xff00000000).withOpacity(0.55),
                        size: 28,
                      ),
                      Text(
                        "Hotels",
                        style: TextStyle(
                            color: const Color(0xff00000000).withOpacity(0.55),
                            fontFamily: 'Regular'),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.directions_bus_outlined,
                        color: const Color(0xff00000000).withOpacity(0.55),
                        size: 28,
                      ),
                      Text(
                        "Bus & travels",
                        style: TextStyle(
                            color: const Color(0xff00000000).withOpacity(0.55),
                            fontFamily: 'Regular'),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.explore_outlined,
                        color: const Color(0xff00000000).withOpacity(0.55),
                        size: 28,
                      ),
                      Text(
                        "Experience",
                        style: TextStyle(
                            color: const Color(0xff00000000).withOpacity(0.55),
                            fontFamily: 'Regular'),
                      )
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Upcoming Trip
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
                                'upcoming Trip',
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
                                  '7d : 10h : 35m',
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
                                    '2 People',
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
                              onPressed: () {},
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
            const SizedBox(
              height: 10,
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
                  padding: const EdgeInsets.only(top: 209),
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
                                    '2 People',
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
                              onPressed: () {},
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

            const SizedBox(
              height: 20,
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Popular Places",
                    style: TextStyle(
                        color: Color(0XFF70846E),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SemiBold'),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset('assets/goa.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Goa",
                                  style: TextStyle(
                                      color: Color(0XFF000000),
                                      fontFamily: 'Medium',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "₹15,000/Person",
                                  style: TextStyle(
                                      color: const Color(0XFF000000)
                                          .withOpacity(0.75),
                                      fontFamily: 'SemiBold',
                                      fontSize: 14),
                                ),
                                Text(
                                  "4 Days",
                                  style: TextStyle(
                                      color: const Color(0XFF000000)
                                          .withOpacity(0.75),
                                      fontFamily: 'SemiBold',
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset('assets/ladakh.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Ladakh",
                                  style: TextStyle(
                                      color: Color(0XFF000000),
                                      fontFamily: 'Medium',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "₹15,000/Person",
                                  style: TextStyle(
                                      color: const Color(0XFF000000)
                                          .withOpacity(0.75),
                                      fontFamily: 'SemiBold',
                                      fontSize: 14),
                                ),
                                Text(
                                  "4 Days",
                                  style: TextStyle(
                                      color: const Color(0XFF000000)
                                          .withOpacity(0.75),
                                      fontFamily: 'SemiBold',
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset('assets/manali.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Manali",
                                  style: TextStyle(
                                      color: Color(0XFF000000),
                                      fontFamily: 'Medium',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "₹15,000/Person",
                                  style: TextStyle(
                                      color: const Color(0XFF000000)
                                          .withOpacity(0.75),
                                      fontFamily: 'SemiBold',
                                      fontSize: 14),
                                ),
                                Text(
                                  "4 Days",
                                  style: TextStyle(
                                      color: const Color(0XFF000000)
                                          .withOpacity(0.75),
                                      fontFamily: 'SemiBold',
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset('assets/udaipur.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Udaipur",
                                  style: TextStyle(
                                      color: Color(0XFF000000),
                                      fontFamily: 'Medium',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "₹15,000/Person",
                                  style: TextStyle(
                                      color: const Color(0XFF000000)
                                          .withOpacity(0.75),
                                      fontFamily: 'SemiBold',
                                      fontSize: 14),
                                ),
                                Text(
                                  "4 Days",
                                  style: TextStyle(
                                      color: const Color(0XFF000000)
                                          .withOpacity(0.75),
                                      fontFamily: 'SemiBold',
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset('assets/jaipur.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Jaipur",
                                  style: TextStyle(
                                      color: Color(0XFF000000),
                                      fontFamily: 'Medium',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "₹15,000/Person",
                                  style: TextStyle(
                                      color: const Color(0XFF000000)
                                          .withOpacity(0.75),
                                      fontFamily: 'SemiBold',
                                      fontSize: 14),
                                ),
                                Text(
                                  "4 Days",
                                  style: TextStyle(
                                      color: const Color(0XFF000000)
                                          .withOpacity(0.75),
                                      fontFamily: 'SemiBold',
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset('assets/shimla.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Shimla",
                                  style: TextStyle(
                                      color: Color(0XFF000000),
                                      fontFamily: 'Medium',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  "₹15,000/Person",
                                  style: TextStyle(
                                      color: const Color(0XFF000000)
                                          .withOpacity(0.75),
                                      fontFamily: 'SemiBold',
                                      fontSize: 14),
                                ),
                                Text(
                                  "4 Days",
                                  style: TextStyle(
                                      color: const Color(0XFF000000)
                                          .withOpacity(0.75),
                                      fontFamily: 'SemiBold',
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
