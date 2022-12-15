import 'dart:typed_data';
import 'dart:convert';
import 'package:fbanime/screens/nav_screen.dart';
import 'package:fbanime/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../util/utils.dart';

class AddPost extends StatefulWidget {
  const AddPost({
    super.key,
  });

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  Uint8List? _file;
  TextEditingController _descriptionController = TextEditingController();

  void postImage(
    String uid,
    String username,
    String profImage,
    Uint8List? _file,
    String description,
  ) async {
    print('entered');
    final url = Uri.parse(
        'https://animeproject-6bd77-default-rtdb.firebaseio.com/posts.json');
    var response = await http.post(url,
        body: json.encode(
          {
            'uid': uid,
            'username': username,
            'profImage': profImage,
            'file': _file,
            'description': description
          },
        ));
    print(response.body);
  }

  _selectImage(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Create a post'),
          children: [
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('Take a photo'),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.camera);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('Choose from  gallery'),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.gallery);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _file == null
        ? Material(
            child: Center(
              child: IconButton(
                onPressed: () => _selectImage(context),
                icon: const Icon(Icons.upload),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.iconLight,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavScreen(),
                  ),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () => postImage(
                          'uid',
                          'username',
                          'profImage',
                          _file,
                          _descriptionController.text,
                        ),
                    child: const Text(
                      'Post',
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
              centerTitle: true,
              title: const Text(
                'Add a post',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://t3.ftcdn.net/jpg/01/67/26/42/240_F_167264239_MJTYeDoQEItDJqlhVV13VVdQ94ViScwe.jpg'),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                            hintText: 'Write a caption!',
                            border: InputBorder.none),
                        maxLines: 8,
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: MemoryImage(_file!),
                                fit: BoxFit.fill,
                                alignment: FractionalOffset.topCenter),
                          ),
                        ),
                      ),
                    ),
                    // const Divider(),
                  ],
                ),
              ],
            ),
          );
  }
}
