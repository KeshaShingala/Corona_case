

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Global/globals.dart';
import '../helpers/api_helpers.dart';
import '../models/countrymodel.dart';

class secondpage extends StatefulWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {


  late Future<CountryData?> getCountry;

  //String? val;

  @override
  void initState(){
    getCountry = CountryAPIHelper.userAPIHelper.fetchingUserData(name: "India");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: getCountry,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error :- ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              CountryData? data = snapshot.data as CountryData?;
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                              "assets/images/cute_girl_dp_image-2184.jpg"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 45,
                          width: 310,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: const Color(0xff484858),
                              )),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(10),
                              isExpanded: true,
                              value: "India",
                              items: countryAll
                                  .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600),
                                ),
                              ))
                                  .toList(),
                              onChanged: (e) {
                                String  val = e.toString();
                                setState(() {
                                  getCountry = CountryAPIHelper.userAPIHelper.fetchingUserData(name: val);
                                });
                              },
                              dropdownColor: const Color(0xff797993),
                              style: GoogleFonts.poppins(color: Colors.white),
                              iconEnabledColor: Colors.green,
                              icon: const Icon(Icons.location_on),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/images/corona.jpg",
                          fit: BoxFit.fill,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.red.shade200,
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 43,
                            width: 170,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                "Tracker",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            "Symptoms",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.red.shade300,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Country",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "State",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "City",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "WorldWide",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 150,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Colors.pink.shade50,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Deaths",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.pink,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 70,
                                ),
                                Text("",
                                 // data!.death.toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.pink,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Infected",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  "",
                                //  data!.infected.toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 150,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Recovered",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  data!.recovered.toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Active",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  data.active.toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        border: Border.all(color: Colors.grey.shade800),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.home,
                            color: Colors.grey,
                          ),
                          Icon(
                            Icons.search,
                            color: Colors.grey.shade700,
                          ),
                          Icon(Icons.settings, color: Colors.grey.shade700),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
        backgroundColor: Colors.black38,
      ),
    );
  }
}

// class secondpage extends StatefulWidget {
//   const secondpage({Key? key}) : super(key: key);
//
//   @override
//   State<secondpage> createState() => _secondpageState();
// }
//
// class _secondpageState extends State<secondpage> {
//
//   String val = "India";
//   int indexOfCountry = 73;
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       backgroundColor: const Color(0xff302E3B),
//       body: FutureBuilder(
//         future: CountryAPIHelper.userAPIHelper.fetchingUserData(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text("Error :- ${snapshot.error}"),
//             );
//           } else if (snapshot.hasData) {
//             List<CountryData>? data = snapshot.data as List<CountryData>?;
//
//             return Stack(
//               children: [
//                 CarouselSlider(
//                   options: CarouselOptions(
//                       height: 400, autoPlay: true, viewportFraction: 1),
//                   items: [1, 2, 3, 4].map((i) {
//                     return Builder(
//                       builder: (BuildContext context) {
//                         return Container(
//                           height: 300,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   fit: BoxFit.cover,
//                                   image: AssetImage("assest/covid $i.jpg"))),
//                           child: Container(
//                             height: 300,
//                             width: double.infinity,
//                             color: CupertinoColors.darkBackgroundGray
//                                 .withOpacity(0.6),
//                             child: Center(
//                               child: Text(
//                                 "'' Together, We will Defeat\n COVID-19. ''",
//                                 textAlign: TextAlign.center,
//                                 style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white,
//                                     fontSize: 20),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }).toList(),
//                 ),
//                 Positioned(
//                   top: 50,
//                   left: 20,
//                   child: Container(
//                     height: 55,
//                     width: 55,
//                     decoration: BoxDecoration(
//                       color: const Color(0xff1e1e2a),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: const Center(
//                       child: Icon(
//                         Icons.menu,
//                         color: Color(0xff797993),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Container(
//                       height: 400,
//                       width: double.infinity,
//                       decoration: const BoxDecoration(
//                         color: Color(0xff302E3B),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(50),
//                           topRight: Radius.circular(50),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(15),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Center(
//                               child: Container(
//                                 height: 60,
//                                 width: 350,
//                                 padding:
//                                 const EdgeInsets.symmetric(horizontal: 10),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(15),
//                                     border: Border.all(
//                                       color: const Color(0xff484858),
//                                     )),
//                                 child: DropdownButtonHideUnderline(
//                                   child: DropdownButton(
//                                     borderRadius: BorderRadius.circular(10),
//                                     isExpanded: true,
//                                     value: val,
//                                     items: countryAll
//                                         .map((e) => DropdownMenuItem(
//                                       value: e,
//                                       child: Text(
//                                         e,
//                                         style: GoogleFonts.poppins(),
//                                       ),
//                                     ))
//                                         .toList(),
//                                     onChanged: (value) {
//                                       setState(() {
//                                         val = value.toString();
//                                         List.generate(countryAll.length,
//                                                 (index) {
//                                               if (countryAll[index] == val) {
//                                                 return indexOfCountry = index;
//                                               }
//                                             });
//                                       });
//                                     },
//                                     dropdownColor: const Color(0xff797993),
//                                     style: GoogleFonts.poppins(
//                                         color: Colors.white),
//                                     iconEnabledColor: Colors.green,
//                                     icon: const Icon(Icons.pin_drop_outlined),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               "Case Update",
//                               style: GoogleFonts.poppins(
//                                   textStyle: const TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w600,
//                                       color: Colors.white)),
//                             ),
//                             Text(
//                               "Newest updates of ${DateTime.now().day} || ${DateTime.now().month} || ${DateTime.now().year}\n population || ${data![indexOfCountry].population.toString()}",
//                               style: GoogleFonts.poppins(
//                                   textStyle: const TextStyle(
//                                       color: Color(0xff797993))),
//                             ),
//                             SizedBox(
//                               height: 150,
//                               width: 350,
//                               child: ListView(
//                                 scrollDirection: Axis.horizontal,
//                                 children: [
//                                   Container(
//                                     height: 200,
//                                     width: 200,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(15),
//                                         border: Border.all(
//                                           color: const Color(0xff484858),
//                                         )),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Radio(
//                                             activeColor: Colors.orange,
//                                             value: "1",
//                                             groupValue: "1",
//                                             onChanged: (val) {}),
//                                         Text(
//                                           data[indexOfCountry]
//                                               .infected
//                                               .toString(),
//                                           style: GoogleFonts.poppins(
//                                               textStyle: const TextStyle(
//                                                   color: Colors.orange,
//                                                   fontWeight: FontWeight.w600,
//                                                   fontSize: 40)),
//                                         ),
//                                         Text("Infected",
//                                             style: GoogleFonts.poppins(
//                                                 textStyle: const TextStyle(
//                                                     color: Color(0xff797993))))
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 30,
//                                   ),
//                                   Container(
//                                     height: 200,
//                                     width: 200,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(15),
//                                         border: Border.all(
//                                           color: const Color(0xff484858),
//                                         )),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Radio(
//                                             activeColor: Colors.red,
//                                             value: "1",
//                                             groupValue: "1",
//                                             onChanged: (val) {}),
//                                         Text(
//                                           data[indexOfCountry].death.toString(),
//                                           style: GoogleFonts.poppins(
//                                               textStyle: const TextStyle(
//                                                   color: Colors.red,
//                                                   fontWeight: FontWeight.w600,
//                                                   fontSize: 40)),
//                                         ),
//                                         Text("Deaths",
//                                             style: GoogleFonts.poppins(
//                                                 textStyle: const TextStyle(
//                                                     color: Color(0xff797993))))
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 30,
//                                   ),
//                                   Container(
//                                     height: 200,
//                                     width: 200,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(15),
//                                         border: Border.all(
//                                           color: const Color(0xff484858),
//                                         )),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Radio(
//                                             activeColor: Colors.green,
//                                             value: "1",
//                                             groupValue: "1",
//                                             onChanged: (val) {}),
//                                         Text(
//                                           data[indexOfCountry]
//                                               .recovered
//                                               .toString(),
//                                           style: GoogleFonts.poppins(
//                                               textStyle: const TextStyle(
//                                                   color: Colors.green,
//                                                   fontWeight: FontWeight.w600,
//                                                   fontSize: 40)),
//                                         ),
//                                         Text("Recoved",
//                                             style: GoogleFonts.poppins(
//                                                 textStyle: const TextStyle(
//                                                     color: Color(0xff797993))))
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       )),
//                 )
//               ],
//             );
//           }
//           return const Center(child: CircularProgressIndicator());
//         },
//       ),
//       bottomNavigationBar: Container(
//         height: 70,
//         width: MediaQuery.of(context).size.width,
//         decoration: const BoxDecoration(
//           color: Color(0xff1e1e2a),
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Container(
//               height: 40,
//               width: 100,
//               decoration: BoxDecoration(
//                   color: const Color(0xff797993),
//                   borderRadius: BorderRadius.circular(20)),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   const Icon(
//                     Icons.home_outlined,
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                   Text(
//                     "Home",
//                     style: GoogleFonts.poppins(
//                         textStyle: const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 12)),
//                   )
//                 ],
//               ),
//             ),
//             const Icon(
//               Icons.search,
//               color: Colors.white,
//               size: 25,
//             ),
//             const Icon(
//               Icons.menu,
//               color: Colors.white,
//               size: 25,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
