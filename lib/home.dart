import "package:appqrcode/bottomNavigation.dart";
import "package:flutter/material.dart";

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Stack(
        children: [
          Column(
            children: [
              Header(),
              Options()

            ],
          ),
          Positioned(bottom:0,right:0,left:0,child:BottomNavigation())
        ],
      ),),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                  "images/background.png"
              )
          ),
          borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.only(top:20,left:30,right:30),
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
                    hintText: 'Search',
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

class Options extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
                height:70,
                width:70,
                child: Icon(Icons.add,color:Colors.blue,size:40),
              ),
              SizedBox(height: 5,),
              Text("Add",style:TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Column(
            children: [
              Container(decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
                height:70,
                width:70,
                child: Icon(Icons.qr_code,color:Colors.blue,size:40),
              ),
              SizedBox(height: 5,),
              Text("QRcode",style:TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Column(
            children: [
              Container(decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
                height:70,
                width:70,
                child: Icon(Icons.history,color:Colors.blue,size:40),
              ),
              SizedBox(height: 5,),
              Text("History",style:TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Column(
            children: [
              Container(decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
                height:70,
                width:70,
                child: Icon(Icons.book,color:Colors.blue,size:40),
              ),
              SizedBox(height: 5,),
              Text("Passbook",style:TextStyle(fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
  }
}





