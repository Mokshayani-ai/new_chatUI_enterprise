import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();
  File? selectedFile; // This will hold the selected file
  final TextEditingController _queryController = TextEditingController();

  // Method to capture an image from the camera and send it to the backend
  Future<void> _captureImageAndUpload() async {
    try {
      // Capture image using the camera
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        File file = File(image.path); // Convert XFile to File

        // Display snackbar with image captured message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image captured: ${image.name}')),
        );

        // Upload the image to the backend
        await _uploadFile(file);
      }
    } catch (e) {
      print('Error capturing image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error capturing image')),
      );
    }
  }

  // Method to upload the image to the backend
  Future<void> _uploadFile(File file) async {
    final String apiUrl =
        'http://your-backend-url/ocr'; // Replace with your actual API URL

    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        file.path,
      ));

      var response = await request.send();
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image uploaded successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to upload image')),
        );
      }
    } catch (e) {
      print('Error uploading image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error uploading image')),
      );
    }
  }

// Method to handle file or image selection from the attach icon
  Future<void> _pickFile() async {
    try {
      final option = await showModalBottomSheet<String>(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a photo'),
                onTap: () => Navigator.pop(context, 'camera'),
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from gallery'),
                onTap: () => Navigator.pop(context, 'gallery'),
              ),
              ListTile(
                leading: Icon(Icons.file_copy),
                title: Text('Choose a file'),
                onTap: () => Navigator.pop(context, 'file'),
              ),
            ],
          );
        },
      );

      if (option == null) return;

      File? file;
      final picker = ImagePicker();

      switch (option) {
        case 'camera':
          final pickedFile = await picker.pickImage(source: ImageSource.camera);
          if (pickedFile != null) file = File(pickedFile.path);
          break;
        case 'gallery':
          final pickedFile =
              await picker.pickImage(source: ImageSource.gallery);
          if (pickedFile != null) file = File(pickedFile.path);
          break;
        case 'file':
          final pickedFile =
              await FilePicker.platform.pickFiles(type: FileType.any);
          if (pickedFile != null) file = File(pickedFile.files.single.path!);
          break;
      }

      if (file != null) {
        setState(() {
          selectedFile = file;
        });
        // Navigate to chat screen with the selected file
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              initialQuery: '[File Uploaded]', // Pass a placeholder message
              file: selectedFile, // Pass the file
            ),
          ),
        );
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  // Handle query submission and navigate to the chat screen
  void _handleQuerySubmission() {
    String query = _queryController.text.trim();
    if (query.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ChatScreen(initialQuery: query)), // Pass query to ChatScreen
      );
      _queryController.clear(); // Clear the query after submission
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF15343E),
              Color(0xFF272222),
            ],
            begin: Alignment(-1.0, -0.5),
            end: Alignment(1.0, 0.5),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
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
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/images/Photograph.png'),
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
                      onPressed: () {},
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
                        minimumSize: Size(10, 50),
                      ),
                    ),
                    SizedBox(width: 7),
                    ElevatedButton(
                      onPressed: () {},
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
                        minimumSize: Size(0, 50),
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
                      IconButton(
                        onPressed: _pickFile,
                        icon: Icon(
                          Icons.attach_file,
                          color: Colors.white60,
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextField(
                            controller: _queryController,
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
                        onPressed: _handleQuerySubmission,
                        child: Text(
                          '➤',
                          style: TextStyle(
                            color: Colors.black,
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
                        onPressed: _pickFile,
                        child: Text(
                          'Upload your files', // <anubhav> file upload feature -- done
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Aleo',
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF353C53),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side:
                                  BorderSide(color: Colors.grey, width: 0.35)),
                          minimumSize: Size(0, 50),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _captureImageAndUpload,
                        child: Text(
                          'Add via Camera', // <anubhav> image upload feature -- done
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Aleo',
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF353C53),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                    color: Colors.grey, width: 0.35)),
                            minimumSize: Size(0, 50)),
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
                              'Sample chat message #$index', //<anubhav> please add chat history here.
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
  final String initialQuery; // Accepts initial query from the HomeScreen
  final File? file; // Accepts file from the HomeScreen if available

  ChatScreen({required this.initialQuery, this.file});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> _messages = [];
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialQuery.isNotEmpty) {
      _handleSubmitted(widget.initialQuery);
    }
    if (widget.file != null) {
      _uploadFile(widget.file!);
    }
  }

  // Add Flask API URL here
  final String flaskUrl =
      'http://10.103.119.157:5000/ask'; // Replace with your Flask API URL
  final String uploadUrl =
      'http://10.103.119.157:5000/ocr'; // Replace with your Flask file upload API

  void _handleSubmitted(String text) async {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUser: true,
    );
    setState(() {
      _messages.insert(0, message);
    });

    // Send user query to Flask backend
    final response = await _sendMessageToFlaskAPI(text);

    if (response != null) {
      _addAIResponse(response);
    } else {
      _addAIResponse("Sorry, I couldn't fetch a response.");
    }
  }

  Future<String?> _sendMessageToFlaskAPI(String userMessage) async {
    try {
      final response = await http.post(
        Uri.parse(flaskUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'message': userMessage}),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data['response'];
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<void> _uploadFile(File file) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(uploadUrl));
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        file.path,
      ));

      var response = await request.send();
      if (response.statusCode == 200) {
        setState(() {
          _messages.insert(
            0,
            ChatMessage(text: '[File Uploaded]', isUser: true),
          );
        });
      } else {
        _addAIResponse("Failed to upload file.");
      }
    } catch (e) {
      print("File upload error: $e");
      _addAIResponse("Error uploading file.");
    }
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
                  hintStyle:
                      TextStyle(color: Colors.white54, fontFamily: 'Aleo'),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
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
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.attach_file,
                color: Colors.white60,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white60,
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
  }
}

// Widget to display a chat message (either user or bot)
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
        crossAxisAlignment:
            isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isUser ? Color(0xFF393F4D) : Color(0xFF2E3338),
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
