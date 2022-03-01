import 'package:appqrcode/AppColor/colors.dart';
import "package:flutter/material.dart";

import 'category_cart.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class CategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 200,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text('Categories',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black))),
            ],
          ),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                CategoryCard(
                    Icon(
                      Icons.book,
                      size: 40,
                    ),
                    'Book'),
                CategoryCard(
                    Icon(
                      Icons.computer,
                      size: 40,
                    ),
                    'Laptops'),
                CategoryCard(
                    Icon(
                      Icons.videogame_asset,
                      size: 40,
                    ),
                    'Games'),
                CategoryCard(
                    Icon(
                      Icons.videocam,
                      size: 40,
                    ),
                    'Movies'),
                CategoryCard(
                    Icon(
                      Icons.watch,
                      size: 40,
                    ),
                    'Watches'),
                CategoryCard(
                    Icon(
                      Icons.weekend,
                      size: 40,
                    ),
                    'Furniture'),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(child: Text('Products',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black))),
            ],
          ),
        ],
      ),
    );
  }
}

class listBills extends StatelessWidget{
    @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
        child: Column(
          children:[
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width-20,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1,1),
                        blurRadius: 10.0,
                        spreadRadius: 2
                    )
                  ]
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 3,
                                      color: Colors.grey
                                  ),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "images/brand1.png"
                                      )
                                  )
                              ),

                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "KenGen Power",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.mainColor,
                                      fontWeight: FontWeight.w700
                                  ),

                                ),
                                SizedBox(height: 10),
                                Text(
                                  "ID 123456",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.idColor,
                                      fontWeight: FontWeight.w700
                                  ),

                                )
                              ],
                            ),

                          ],
                        ),
                        Text("Date 24th May 2021",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: AppColor.green, fontWeight: FontWeight.w700),),
                        SizedBox(height: 10,),

                      ],

                    ),

                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColor.selectBackground

                              ),
                              child: Center(
                                child: Text(
                                  "Select",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.selectColor
                                  ),
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            Text(
                              "Entered 3 days",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.mainColor
                              ),
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                        SizedBox(width: 20,),
                      ],
                    )
                  ],
                ),

              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width-20,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1,1),
                        blurRadius: 10.0,
                        spreadRadius: 2
                    )
                  ]
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 3,
                                      color: Colors.grey
                                  ),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "images/brand1.png"
                                      )
                                  )
                              ),

                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "KenGen Power",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.mainColor,
                                      fontWeight: FontWeight.w700
                                  ),

                                ),
                                SizedBox(height: 10),
                                Text(
                                  "ID 123456",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.idColor,
                                      fontWeight: FontWeight.w700
                                  ),

                                )
                              ],
                            ),

                          ],
                        ),
                        Text("Date 24th May 2021",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: AppColor.green, fontWeight: FontWeight.w700),),
                        SizedBox(height: 10,),

                      ],

                    ),

                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColor.selectBackground

                              ),
                              child: Center(
                                child: Text(
                                  "Select",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.selectColor
                                  ),
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            Text(
                              "Entered 3 days",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.mainColor
                              ),
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                        SizedBox(width: 20,),
                      ],
                    )
                  ],
                ),

              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width-20,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1,1),
                        blurRadius: 10.0,
                        spreadRadius: 2
                    )
                  ]
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 3,
                                      color: Colors.grey
                                  ),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "images/brand1.png"
                                      )
                                  )
                              ),

                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "KenGen Power",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.mainColor,
                                      fontWeight: FontWeight.w700
                                  ),

                                ),
                                SizedBox(height: 10),
                                Text(
                                  "ID 123456",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.idColor,
                                      fontWeight: FontWeight.w700
                                  ),

                                )
                              ],
                            ),

                          ],
                        ),
                        Text("Date 24th May 2021",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: AppColor.green, fontWeight: FontWeight.w700),),
                        SizedBox(height: 10,),

                      ],

                    ),

                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColor.selectBackground

                              ),
                              child: Center(
                                child: Text(
                                  "Select",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.selectColor
                                  ),
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            Text(
                              "Entered 3 days",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.mainColor
                              ),
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                        SizedBox(width: 20,),
                      ],
                    )
                  ],
                ),

              ),
            ),

            // Container(
            //   width: MediaQuery.of(context).size.width-20,
            //   height: 100,
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.only(
            //         topRight: Radius.circular(30),
            //         bottomRight: Radius.circular(30),
            //       ),
            //       boxShadow: [
            //         BoxShadow(
            //             color: Colors.grey,
            //             offset: Offset(1,1),
            //             blurRadius: 10.0,
            //             spreadRadius: 2
            //         )
            //       ]
            //   ),
            //   child: Container(
            //     margin: const EdgeInsets.only(top: 10, left: 18),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Column(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Row(
            //               children: [
            //                 Container(
            //                   height: 60,
            //                   width: 60,
            //                   decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(10),
            //                       border: Border.all(
            //                           width: 3,
            //                           color: Colors.grey
            //                       ),
            //                       image: DecorationImage(
            //                           fit: BoxFit.cover,
            //                           image: AssetImage(
            //                               "images/brand1.png"
            //                           )
            //                       )
            //                   ),
            //
            //                 ),
            //                 SizedBox(width: 10,),
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(
            //                       "KenGen Power",
            //                       style: TextStyle(
            //                           fontSize: 16,
            //                           color: AppColor.mainColor,
            //                           fontWeight: FontWeight.w700
            //                       ),
            //
            //                     ),
            //                     SizedBox(height: 10),
            //                     Text(
            //                       "ID 123456",
            //                       style: TextStyle(
            //                           fontSize: 16,
            //                           color: AppColor.idColor,
            //                           fontWeight: FontWeight.w700
            //                       ),
            //
            //                     )
            //                   ],
            //                 ),
            //
            //               ],
            //             ),
            //             Text("Date 24th May 2021",
            //               textAlign: TextAlign.start,
            //               style: TextStyle(color: AppColor.green, fontWeight: FontWeight.w700),),
            //             SizedBox(height: 10,),
            //
            //           ],
            //
            //         ),
            //
            //         Row(
            //           children: [
            //             Column(
            //               children: [
            //                 Container(
            //                   width: 80,
            //                   height: 30,
            //                   decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(30),
            //                       color: AppColor.selectBackground
            //
            //                   ),
            //                   child: Center(
            //                     child: Text(
            //                       "Select",
            //                       style: TextStyle(
            //                           fontSize: 16,
            //                           color: AppColor.selectColor
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //                 Expanded(child: Container()),
            //                 Text(
            //                   "\$1234",
            //                   style: TextStyle(
            //                       fontSize: 14,
            //                       fontWeight: FontWeight.w900,
            //                       color: AppColor.mainColor
            //                   ),
            //                 ),
            //                 Text(
            //                   "Entered 3 days",
            //                   style: TextStyle(
            //                       fontSize: 14,
            //                       fontWeight: FontWeight.w700,
            //                       color: AppColor.mainColor
            //                   ),
            //                 ),
            //                 SizedBox(height: 10,),
            //               ],
            //             ),
            //             SizedBox(width: 20,),
            //           ],
            //         )
            //       ],
            //     ),
            //
            //   ),
            // )
          ],


        ));
  }
}



class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Header(),
                // CategoryWidget(),
                listBills(),
              ],
            ),
            //Positioned(bottom:0,right:0,left:0,child:BottomNavigation())
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage("images/background.png")),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(top: 20, left: 5, right: 5),
      child: Stack(
        children: [
          Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 3,
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  minLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        )),
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    hintText: 'Search by name',
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                  ),
                ),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("DEVICE MANAGEMENT APPLICATION",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello User",
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text("Wellcome to my app",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                            image: AssetImage("images/user.png"),
                            fit: BoxFit.fill)),
                  )
                ],
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ],
      ),
    );
  }
}
