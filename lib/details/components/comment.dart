import 'package:appqrcode/services/CreateCommentService.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:appqrcode/models/Equipment.dart';
import 'package:appqrcode/services/EquipmentService.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  @override
  void initState() {
    super.initState();
    _future = getEquipment(widget.qrcode);
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();

  // List filedata = [
  //   {
  //     'name': 'Maintainer3',
  //     'pic': 'assets/images/Profile Image.png',
  //     'message': 'Done calibrate on 22/1/2022'
  //   },
  //   {
  //     'name': 'Maintainer2',
  //     'pic': 'assets/images/Profile Image.png',
  //     'message': 'Need to replace part MS-213'
  //   },
  //   {
  //     'name': 'Maintainer2',
  //     'pic': 'assets/images/Profile Image.png',
  //     'message': 'Check and work fine'
  //   },
  //   {
  //     'name': 'Admin',
  //     'pic': 'assets/images/Profile Image.png',
  //     'message': 'Create equipment'
  //   },
  // ];

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
                        String title = 'mobile-comment';
                        String description = commentController.text;
                        String equipmentId = snapshot.data!.id;
                        print(equipmentId);
                      createComment(title, description, equipmentId);
                      //comments?.insert(0, value);
                    setState(() {});
                    commentController.clear();
                    FocusScope.of(context).unfocus();
                    //Navigator.pop(context);  // pop current page
                    //Navigator.pushNamed(context, "Setting");
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