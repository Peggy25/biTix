import 'dart:async';
import 'dart:io';
import 'package:bitix/app/auth/services/auth_services.dart';
import 'package:bitix/app/auth/services/firebase_storage.dart';
import 'package:bitix/app/home/dashboard/dashboard_page.dart';
import 'package:bitix/wrapper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:bitix/app/auth/models/register.dart';
import 'package:bitix/app/auth/register/register_page.dart';
import 'package:bitix/shared/assets.dart';
import 'package:bitix/shared/font_style.dart';
import 'package:bitix/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploadProfile extends StatefulWidget {
  final RegistrationUser? registrationUser;
  const UploadProfile({Key? key, this.registrationUser}) : super(key: key);

  @override
  _UploadProfileState createState() => _UploadProfileState();
}

class _UploadProfileState extends State<UploadProfile> {
  // open image
  File? _imageFile;
  UploadTask? task;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final temp = File(image.path);
      setState(() {
        _imageFile = temp;
        widget.registrationUser!.profileImage = _imageFile;
      });
    } on PlatformException catch (e) {
      print("failed to pick image");
    }
  }

  // upload image
  Future uploadFile(BuildContext context) async {
    if (_imageFile == null) {
      return false;
    } else {
      final fileName = basename(_imageFile!.path);
      final destination = 'files/$fileName';

      task = FirebaseApi.uploadFile(destination, _imageFile!);
      setState(() {});

      if (task == null) return;

      final snapshot = await task!.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      var duration = const Duration(seconds: 1);
      AuthServices.register(
          email: widget.registrationUser!.email,
          name: widget.registrationUser!.name,
          password: widget.registrationUser!.password,
          profilePicture: urlDownload);
      Timer(duration, () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute<void>(builder: (_) => const DashboardPage()));
      });
      print('Download-Link: $urlDownload');
    }
  }

  @override
  Widget build(BuildContext context) {
    final fileName =
        _imageFile != null ? basename(_imageFile!.path) : 'No File selected';
    return WillPopScope(
        // on backpress
        onWillPop: () async {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                  builder: (_) => RegisterPage(
                        registrationUser: widget.registrationUser,
                      )));
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Expanded(
                child: Text(
                  'Upload Profile',
                  style: fontStyle.copyWith(fontSize: 20),
                ),
              ),

              // circle image
              Expanded(
                flex: 3,
                child: Center(
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: (widget.registrationUser!.profileImage == null)
                          ? DecorationImage(
                              image: AssetImage(
                                  ImageApp.get(ImageApp.img_user_pic)),
                              fit: BoxFit.cover)
                          : DecorationImage(
                              image: FileImage(
                                  widget.registrationUser!.profileImage!),
                              fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
              // end circle image
              TextButton(
                onPressed: () async {
                  if (widget.registrationUser!.profileImage == null) {
                    pickImage();
                  } else {
                    setState(() {
                      widget.registrationUser!.profileImage = null;
                    });
                  }
                },
                child: Text(
                  widget.registrationUser!.profileImage != null
                      ? 'Hapus Gambar'
                      : 'Tambah Gambar',
                  style: fontStyle.copyWith(fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 50,
              ),

              /// progress upload

              (task != null) ? buildUploadStatus(task!) : Container(),

              ///
              //button
              const SizedBox(
                height: 30,
              ),
              ButtonPrimary(
                heightButton: 60,
                onTap: () {
                  uploadFile(context);
                },
                textButton: 'Upload Image',
              ),
              //end button

              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ));
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style:
                  fontStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}
