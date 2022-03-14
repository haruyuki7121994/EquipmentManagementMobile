import 'package:appqrcode/services/CreateCommentService.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:appqrcode/models/Equipment.dart';
import 'package:appqrcode/services/EquipmentService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appqrcode/main_page.dart';
import 'package:appqrcode/login.dart';


class Comment extends StatefulWidget {
  // static String routeName = "/comment";
  final String qrcode;
  Comment({Key? key, required this.qrcode }) : super(key: key);
  //required this.equipment
  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  Future<Equipment>? _future;

  get qrocde => widget.qrcode;


  @override
  void initState() {
    checkRole(context);
    super.initState();
    _future = getEquipment(widget.qrcode);
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/Profile Image.png")),
                ),
              ),
              title: Text(
                data[i].userId,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i].description),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    int refresh =1;
    //List<Comments>? comments = widget.equipment.comments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment Page"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: FutureBuilder<Equipment>(
          future: _future,
          builder: (context, snapshot){
            if (snapshot.hasData){
              return CommentBox(
                userImage: "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
                child: commentChild(snapshot.data!.comments),
                labelText: 'Write a comment...',
                withBorder: false,
                errorText: 'Comment cannot be blank',
                sendButtonMethod: () {
                  if (formKey.currentState!.validate()) {
                    print(commentController.text);


                    setState(() {
                      String title = 'mobile-comment';
                      String description = commentController.text;
                      String equipmentId = snapshot.data!.id;
                      print(equipmentId);
                      createComment(title, description, equipmentId);
                    });
                    commentController.clear();
                    FocusScope.of(context).unfocus();
                    Navigator.pop(context);  // pop current page
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Comment(qrcode: qrocde)));
                    //return Container();
                  } else {
                    print("Not validated");
                  }
                },
                formKey: formKey,
                commentController: commentController,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
              );
            }else if(snapshot.hasError){
              return Text('$snapshot.error');
            }
            return const CircularProgressIndicator();
          }
        ),
      ),
    );
  }
}

checkRole(BuildContext context)async{
  final sharedPreferences = await SharedPreferences.getInstance();
  final role = sharedPreferences.getString('roles');

  if(role == '[ROLE_GUEST]'){

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('You do not have this permission'),
        content: const Text('Please log in with role Maintainer'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
            child: const Text('Login'),
          ),
        ],
      ),
    );
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainPage())
    );
  }
}