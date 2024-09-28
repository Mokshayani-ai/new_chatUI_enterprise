import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mokshayani.ai",
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Color(0xFF15343E),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontFamily: 'Aleo'),
          bodyMedium: TextStyle(color: Colors.white, fontFamily: 'Aleo'),
        ),
      ),
      home: LoginPage(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF164858),
              Color(0xFF272222),
            ],
            begin: Alignment(2.3, -0.5),
            end: Alignment(1.0, 0.5),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "MOKSHAYANI.AI",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "Aleo",
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Good\nmorning,\nManya', // <anubhav> please use your username variable here. Also, the time of the day - for the greeting.
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'Aleo',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('LOG-OUT',
                        style: TextStyle(
                          color:Colors.white70,
                          fontFamily: 'Aleo',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                        backgroundColor: Color(0xFF292D32),
                        content: Text('Are you sure you want to logout?',
                        style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Aleo',
                          fontSize: 15,
                        )),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Cancel',
                            style: TextStyle(
                              fontFamily: 'Aleo',
                              fontSize:15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('Log-out',
                            style: TextStyle(
                              fontFamily: 'Aleo',
                              fontSize:15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                            onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                          ),
                        ],
                      );
                    },
                  );
                },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/Photograph.png'),
                      ),
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                // Corpus buttons
                Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyCorpus()),
                    );
                  },
                      child: Text(
                        'My corpus', //<anubhav> please link this to the stored user corpus ( files and image analysis )
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Aleo',
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF353C53),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: Size(10,50),
                      ),
                    ),
                    SizedBox(width:7),
                    ElevatedButton(
                      onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrgCorpus()),
                    );
                  },
                      child: Text(
                        'Org. corpus', //<anubhav> please link this to the stored organization corpus. 
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Aleo',
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF353C53),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          //side: BorderSide(color:Colors.white70 , width:0.35)
                        ),
                        minimumSize: Size(0,50),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                             
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFF33363E),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  
                  child: Row(
                    children: [
                       // 90 degrees in radians (π/2)
                         Icon(
                          Icons.attach_file,
                          color: Colors.white60,
                        ),
                      
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: 'What do you wanna know?',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontFamily: 'Aleo'),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()),
                    );
                  },
                  child: Text(
                    '➤',
                    style: TextStyle(
                      color: Colors.black ,
                      fontFamily: 'Aleo',
                      fontSize: 20,
                      
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    //backgroundColor: Color(0xFF292D32),
                    backgroundColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    
                  ),
                ),
                SizedBox(height: 20),
                    ],
                  ),
                ),
                
                SizedBox(height: 20),

                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Upload your files', // <anubhav> file upload feature 
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Aleo',
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF353C53),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color:Colors.grey, width:0.35)
                          ),
                          minimumSize: Size(0,50),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Add via Camera', // <anubhav> image upload feature 
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Aleo',
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF353C53),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.grey, width:0.35)
                          ),
                          minimumSize:Size(0, 50)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // "Chat History" section
                Text( 
                  "Chat History",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Aleo',
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF292D32),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.all(16),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF33363E),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'Sample chat message #$index',   //<anubhav> please add chat history here.
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Aleo',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> _messages = [];
  TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUser: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    // Simulate AI response
    Future.delayed(Duration(seconds: 1), () {
      _addAIResponse("This is a simulated AI response to: $text");
    });
  }

  void _addAIResponse(String text) {
    ChatMessage aiMessage = ChatMessage(
      text: text,
      isUser: false,
    );
    setState(() {
      _messages.insert(0, aiMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MOKSHAYANI.AI',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Aleo',
            fontSize: 15,
          ),
        ),
        backgroundColor: Color(0xFF15343E),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white70),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF15343E), Color(0xFF272222)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true, 
                itemCount: _messages.length,
                itemBuilder: (context, index) => _messages[index],
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }

 Widget _buildMessageComposer() {
  return Padding(
    padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 50.0),
    child: Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF444343),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: TextField(
              controller: _textController,
              style: TextStyle(color: Colors.white, fontFamily: 'Aleo'),
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: TextStyle(color: Colors.white54, fontFamily: 'Aleo'),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                prefixIcon: Icon(Icons.attach_file, color:Colors.white70),
                prefixIconConstraints: BoxConstraints(minWidth: 40, maxWidth: 40),

              ),
              onSubmitted: (text) {
                if (text.isNotEmpty) {
                  _handleSubmitted(text);
                }
              },
            ),
          ),
        ),
        SizedBox(width: 8.0), 
        Container(
          decoration: BoxDecoration(
            //color:  Color(0xFF444343),
            color:  Colors.white60,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.send, color: Colors.white),
            onPressed: () {
              if (_textController.text.isNotEmpty) {
                _handleSubmitted(_textController.text);
              }
            },
          ),
        ),
      ],
    ),
  );
}}
class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (!isUser)
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child:Text(
                "According to your corpus", //<anubhav> we will have to add the AI model's corpus check in here somewhere. 
                style: TextStyle(color: Colors.grey, fontSize: 12, fontFamily: 'Aleo', fontWeight: FontWeight.bold),
              ),
             
              

            ),
             
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isUser ?   Color(0xFF393F4D) : Color.fromARGB(255, 46, 51, 56),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontFamily: 'Aleo'),
            ),
          ),
        ],
      ),
    );
  }
}



// login page 
class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
     body: Container(
      decoration: BoxDecoration(
        gradient : LinearGradient(
          colors: [
            Color(0xFF164858),
            Color(0xFF272222),
          ],
          begin : Alignment(2.0,-0.6),
          end: Alignment(1.0,0.5),
        ),
      ),
      child : Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 150 ,
                height : 150 , 
                child: Image.asset("/Users/manya/chat_sih/my_app/lib/white_nobg_logo.png"),),

                SizedBox(height: 16),
                Text(
                  'MOKSHAYANI.AI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Aleo',
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 32),
                Container (
                  width: 330,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                  color: Color(0xFF292D32),
                 
                  borderRadius: BorderRadius.circular(30),
                  ),
          child: Column(
            children : [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ 
                    ElevatedButton(
                      onPressed: (){},
                      child: Text("SIGN-IN",
                      style : TextStyle(
                        color : Colors.white,
                        fontFamily: 'Aleo',
                        fontSize : 15,
                      )),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF33363E),
                        shape : RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(20),
                          side: BorderSide(color:Colors.grey , width:0.5) 
                          ),
                          minimumSize: Size(0,50)
                      )
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed : (){},
                      child: Text("SIGN-UP" , 
                      style: TextStyle (
                        color : Colors.white,
                        fontFamily : 'Aleo',
                        fontSize : 15
                      )),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF33363E),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.grey, width:0.5)
                          ),
                          minimumSize:Size(0, 50)
                        ),
                    ),
                    
                  ],


                ),

                SizedBox(height:32),
                Container(
                width: 260, 
                child : TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter email address',
                    filled : true , 
                    fillColor : Color(0xFF444343),
                     hintStyle: TextStyle(
                      color: Color.fromARGB(255, 150, 149, 149),
                      fontFamily: 'Aleo',
                      fontSize: 15, ) ,
                      border: OutlineInputBorder(
                  borderRadius : BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ) ,      
                    
                  )
                ),
                ),
          
                SizedBox(height:20),
                Container (
                  width : 260,
                child : TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    
                    hintText : 'Enter password',
                    filled : true, 
                    
                    fillColor: Color(0xFF444343),
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 150, 149, 149),
                      fontFamily: 'Aleo',
                      fontSize: 15, ) ,
                      border: OutlineInputBorder(
                  borderRadius : BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ) ,   
                            
                 ) ,
                  ),
                ),
                    SizedBox(height: 30),
                    SizedBox(
                      width : 150,
                      child: ElevatedButton(
                        onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                        child : Text('Continue',
                        style: TextStyle(
                          fontFamily: 'Aleo',
                          fontSize: 15, 
                          color: Colors.black,
                          fontWeight: FontWeight.bold,

                        )),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          //padding:EdgeInsets.symmetric(vertical:16)
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.white70, width:1)
                          ),
                          minimumSize:Size(0, 50)
                        ),
                       
                      ),
                     
                    ),
                    SizedBox(height:10),
                  
                
                


            ]
                ),
                ),
            ],),
        ) ,)

     )
    );
  }
  }

  //corpus screens 
  class MyCorpus extends StatelessWidget {
  final List<FileInfo> files = [
    FileInfo(name: 'Market_Document.pdf', uploadDate: DateTime(2024, 6, 15)),
    FileInfo(name: 'image21.png', uploadDate: DateTime(2024, 8, 20)),
    FileInfo(name: 'SIH.jpg', uploadDate: DateTime(2024, 9, 23)),
    FileInfo(name: 'idea.png', uploadDate: DateTime(2024, 9, 23)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF14323C),
              Color(0xFF272222),
            ],
            begin: Alignment(1.0, -0.5),
            end: Alignment(1.0, 0.5),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_new, color: Colors.white70),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          width: 200,
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          decoration: BoxDecoration(
                            color: Color(0xFF292D32),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'My Corpus',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 48), // To balance the layout
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'FILE NAME',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'UPLOAD DATE',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: files.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade600, width: 0.5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              files[index].name,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '${files[index].uploadDate.year}-${files[index].uploadDate.month.toString().padLeft(2, '0')}-${files[index].uploadDate.day.toString().padLeft(2, '0')}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrgCorpus extends StatelessWidget {
  final List<FileInfo> files = [
    FileInfo(name: 'HR_Policies_Doc.pdf', uploadDate: DateTime(2024, 1, 5)),
    FileInfo(name: 'PRD_1.pdf', uploadDate: DateTime(2024, 1, 20)),
    FileInfo(name: 'Events2024.pdf', uploadDate: DateTime(2024, 8, 23)),
    FileInfo(name: 'Handbook.pdf', uploadDate: DateTime(2024, 9, 23)),
    FileInfo(name: 'Report23A.pdf', uploadDate: DateTime(2024, 9, 23)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF14323C),
              Color(0xFF272222),
            ],
            begin: Alignment(1.0, -0.5),
            end: Alignment(1.0, 0.5),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_new, color: Colors.white70),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          width: 200,
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          decoration: BoxDecoration(
                            color: Color(0xFF292D32),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Org. Corpus',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 48), // To balance the layout
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'FILE NAME',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'UPLOAD DATE',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: files.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade600, width: 0.5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              files[index].name,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '${files[index].uploadDate.year}-${files[index].uploadDate.month.toString().padLeft(2, '0')}-${files[index].uploadDate.day.toString().padLeft(2, '0')}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FileInfo {
  final String name;
  final DateTime uploadDate;

  FileInfo({required this.name, required this.uploadDate});
}