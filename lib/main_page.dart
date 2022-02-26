import "package:flutter/material.dart";

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Stack(
        children: [
          Column(
            children: [
              Header(),
            ],
          ),
          //Positioned(bottom:0,right:0,left:0,child:BottomNavigation())
        ],
      ),),
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
              fit: BoxFit.fill,
              image: AssetImage(
                  "images/background.png"
              )
          ),
          borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.only(top:20,left:10,right:10),
      child: Stack(
        children: [
          Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(10)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 3,
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  minLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 0,
                          style: BorderStyle.none,)
                    ),
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
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text("DEVICE MANAGEMENT APPLICATION",
                  style:TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color:Colors.white)
              ),
              SizedBox(height:10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello User",
                          style:TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color:Colors.white)
                      ),
                      Text("Wellcome to my app",
                          style:TextStyle(color:Colors.white)
                      )

                    ],),
                  Container(
                    height:60,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(image: AssetImage("images/user.png"),fit:BoxFit.fill)
                    ),
                  )
                ],
              ),

              SizedBox(height: 100,)
            ],
          ),
        ],
      ),
    );
  }
}

