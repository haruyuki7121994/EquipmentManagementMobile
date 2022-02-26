import 'package:appqrcode/edit.dart';
import 'package:flutter/material.dart';


class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {

          },
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'User',
                    ),
                    Text(
                      'user@gmail.com',
                    ),
                    Text(
                     'Admin',
                    ),
                    Text(
                      '012345684',
                    ),
                    Text(
                      '580 cmt8 q3 TpHCM',
                    ),

                Column(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 40,
                      onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePage()));
                      } ,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.blue
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      color: Colors.blue,
                      child: Text(
                        "Update",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(height:0),
                  ],
                ),
                    Column(
                      children: <Widget>[
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 40,
                          onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePage()));
                          } ,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.grey
                              ),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          color: Colors.grey,
                          child: Text(
                            "Logout",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
              ],
                ),
              ),
            ],
          ),
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/userinformation.png'),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 270, left: 184),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}