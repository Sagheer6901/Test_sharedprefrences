import 'dart:io';
import 'package:path/path.dart' as doc_path;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_sharedpreferencees/constants.dart';
import 'package:image_picker/image_picker.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  File? selectedImage;
  bool? isLoading = false;
  final TextEditingController title = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  void dispose() {
    title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cup Cake',
          style: TextStyle(
            color: Constants.secondaryColor,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Constants.primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Constants.secondaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.share_outlined,
              color: Constants.secondaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Constants.primaryColor,
      body: Form(
        key: key,
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(
                  30,
                ),
                topLeft: Radius.circular(
                  30,
                ),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FractionalTranslation(
                    translation: Offset(0.0, -0.6),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.notifications,
                              color: Constants.shadePrimaryColor,
                              size: 30,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 30,
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.title,
                          color: Constants.primaryColor,
                          size: 25,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: Text(
                            "Title",
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Constants.f2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 10,
                    ),
                    child: TextFormField(
                      controller: title,
                      decoration: InputDecoration(
                        fillColor: Constants.secondaryColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          borderSide: BorderSide(
                            color: Constants.secondaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          borderSide: BorderSide(
                            color: Constants.secondaryColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          borderSide: BorderSide(
                            color: Constants.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.description,
                          color: Constants.primaryColor,
                          size: 25,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: Text(
                            "Description",
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Constants.f2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 10,
                    ),
                    child: TextFormField(
                      minLines: 12,
                      maxLines: 12,
                      decoration: InputDecoration(
                        fillColor: Constants.secondaryColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          borderSide: BorderSide(
                            color: Constants.secondaryColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          borderSide: BorderSide(
                            color: Constants.secondaryColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          borderSide: BorderSide(
                            color: Constants.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.photo,
                          color: Constants.primaryColor,
                          size: 25,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: Text(
                            "Photo",
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Constants.f2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Constants.shadePrimaryColor,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    margin: EdgeInsets.only(top: 5, left: 15, right: 15),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () async {
                            final ImagePicker _picker = ImagePicker();
                            setState(() {
                              isLoading = true;
                            });
                            final XFile? image = await _picker.pickImage(
                                source: ImageSource.camera);
                            setState(() {
                              isLoading = false;
                              selectedImage = File(image!.path);
                            });
                          },
                          child: Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Constants.primaryColor,
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            child: (selectedImage == null)
                                ? Icon(
                                    Icons.camera_alt_outlined,
                                    color: Constants.secondaryColor,
                                    size: 40,
                                  )
                                : Image.file(
                                    File(
                                      selectedImage!.path,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            final ImagePicker _picker = ImagePicker();
                            setState(() {
                              isLoading = true;
                            });
                            final XFile? image = await _picker.pickImage(
                                source: ImageSource.gallery);
                            setState(() {
                              isLoading = false;
                              selectedImage = File(image!.path);
                            });
                          },
                          child: Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Constants.primaryColor,
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            child: (selectedImage == null)
                                ? Icon(
                                    Icons.add,
                                    color: Constants.secondaryColor,
                                    size: 40,
                                  )
                                : Image.file(
                                    File(
                                      selectedImage!.path,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 15,
                      left: 25,
                      right: 25,
                      bottom: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Constants.f2,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Constants.secondaryColor),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(150, 55)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  side: BorderSide(
                                    color: Constants.primaryColor,
                                  ),
                                ),
                              )),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        ElevatedButton(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Constants.secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Constants.f2,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Constants.primaryColor),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(150, 55)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  side: BorderSide(
                                    color: Constants.primaryColor,
                                  ),
                                ),
                              )),
                          onPressed: () async {
                            if (key.currentState!.validate() &&
                                selectedImage != null) {
                              setState(() {
                                isLoading = true;
                              });
                              int imageCounter = 0;
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              final Directory? directory =
                                  await getApplicationDocumentsDirectory();
                              final String? path = directory!.path;
                              final String? fileName =
                                  doc_path.basename(selectedImage!.path);
                              final String? fileExtension =
                                  doc_path.extension(selectedImage!.path);
                              selectedImage = await selectedImage!
                                  .copy('$path/$fileName$fileExtension');
                              while (true) {
                                if (prefs.getString('image$imageCounter') ==
                                    null) {
                                  prefs.setString('image$imageCounter',
                                      '$path/$fileName$fileExtension');
                                  prefs.setString(
                                      'imageTitle$imageCounter', title.text);
                                  print('Data Saved!');
                                  break;
                                } else {
                                  imageCounter++;
                                }
                              }
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
