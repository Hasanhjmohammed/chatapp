import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatApp extends StatefulWidget {
  static const String ChatApproute = "ChatApproute";

  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  void initState() {
    super.initState();
    getuser();
  }
  var textcontral=TextEditingController() ;
  final _auth = FirebaseAuth.instance;
  final firecloud = FirebaseFirestore.instance;
  String massege;
  User currentusers;
  bool isme;
  void getuser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        currentusers = user;
        print(currentusers.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void getmasseges() async {
    await for (var masseges in firecloud.collection("masseges").snapshots()) {
      for (var mass in masseges.docs) {
        print(mass.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              height: 40,
              child: Image.asset(
                "images/857418.png",
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 7,
            ),
            Text(
              "your Massage",
              style: TextStyle(color: Colors.blue[800]),
            ),
          ],
        ),
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.blue[800],
              ),
              onPressed: () {
              //  getmasseges();
                _auth.signOut();
                Navigator.pop(context);
              })
        ],
      ),
      body:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: firecloud.collection("masseges").orderBy("time").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final mymassge = snapshot.data.docs.reversed;
                  List<Widget> mymasseges = [];
                  for (var mas in mymassge) {
                    final mymas = mas.get("title");
                    final myemail = mas.get("sender");
                    isme=(currentusers.email==myemail);
                    mymasseges.add(
                      (massegedisgn(sender: myemail,text: mymas,isme: isme,))
                    );
                  }
                  return  Expanded(
                    child: ListView(
                      reverse: true,
                      padding: EdgeInsets.symmetric(horizontal: 20,
                      vertical: 30),
                        children: mymasseges,

                    ),
                  );
                }),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.orangeAccent, width: 2),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textcontral,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Write Your Massage here",
                      ),
                      onChanged: (vale) {
                        massege = vale;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        icon: Icon(
                          Icons.play_arrow_sharp,
                          size: 45,
                          color: Colors.blue[800],
                        ),
                        onPressed: () {
                          textcontral.clear();
                          firecloud.collection("masseges").add({
                            "title": massege,
                            "sender": currentusers.email,
                            "time":FieldValue.serverTimestamp(),
                          });
                        }),
                  )
                ],
              ),
            ),
          ],
        ),


    );
  }
}

class massegedisgn extends StatelessWidget {
  final String sender;
  final String text;
   final bool isme;

  const massegedisgn({ this.isme,  this.sender, this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(

        crossAxisAlignment:isme? CrossAxisAlignment.start:CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Text(sender,
            style: TextStyle(
              color: Colors.orange
            ),),
          ),
          Material(
            borderRadius:isme ? BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
             bottomRight: Radius.circular(20),
            ): BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color:isme? Colors.white:Colors.blue[800],
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color:isme? Colors.black45:Colors.white,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
