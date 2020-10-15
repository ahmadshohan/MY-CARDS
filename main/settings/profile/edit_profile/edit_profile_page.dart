import 'package:mycarts/colors.dart';
import 'package:mycarts/main/settings/profile/edit_profile/edit_profile_controller.dart';
import 'package:mycarts/shared/constant/data_list.dart';
import 'package:mycarts/shared/localization/app_localization.dart';
import 'package:mycarts/shared/widgets/closable.dart';
import 'package:mycarts/shared/widgets/j_raised_button.dart';
import 'package:mycarts/shared/widgets/loader.dart';
import 'package:mycarts/shared/widgets/toaster.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  final String title;
  const EditProfilePage({Key key, this.title = "EditCustomerProfile"})
      : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  EditProfileController _editProfileController = EditProfileController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.button,
            centerTitle: true,
            title: Text(AppLocalization.profile,
                style: TextStyle(color: Colors.white))),
        body: Observer(
            builder: (_) => Stack(
                  children: [
                    Container(
                        height: double.infinity,
                        child: SafeArea(
                            top: true,
                            bottom: true,
                            left: false,
                            right: false,
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: SingleChildScrollView(
                                    child: Column(children: <Widget>[
                                  Form(
                                      key: _formKey,
                                      autovalidate:
                                          _editProfileController.autoValidate,
                                      child: _buildPersonalInfo()),
                                  SizedBox(height: 10),
                                  _buildUpdateButton(),
                                  SizedBox(height: 10),
                                ]))))),
                    Visibility(
                        visible: _editProfileController.loading,
                        child: Center(child: Loader()))
                  ],
                )));
  }

  _buildPersonalInfo() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 5),
              _buildAvatar(),
              SizedBox(height: 13),
              _buildName(),
              SizedBox(height: 13),
              _buildEmail(),
              SizedBox(height: 13),
              _buildPhoneNumber(),
              SizedBox(height: 13),
              _buildCityDropDownButton(),
              SizedBox(height: 13),
              _buildPassword(),
              SizedBox(height: 13),
              _buildPasswordConfirm()
            ]));
  }

  _buildAvatar() {
    return GestureDetector(
      onTap: () => _buildProfilePictureSelector(),
      child: Stack(children: <Widget>[
        CircleAvatar(
            radius: 50,
            backgroundColor: Colors.black12,
            child: Observer(
                builder: (_) => ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: _editProfileController.pictureFile == null
                          ? Image.asset('assets/png/avatar.png',
                              width: 100, height: 100, fit: BoxFit.cover)
                          : Image.file(_editProfileController.pictureFile,
                              width: 100, height: 100, fit: BoxFit.cover),
                    ))),
        Positioned(
            right: 3,
            bottom: 10,
            child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green),
                child: Icon(Icons.camera_alt, color: Colors.white, size: 16))),
      ]),
    );
  }

  _buildName() {
    return TextFormField(
        style: TextStyle(color: AppColors.white),
        onChanged: (value) => _editProfileController.model.userName = value,
        validator: (_) => _editProfileController.checkUserName(),
        onFieldSubmitted: (_) => KeyBoard.close(context),
        decoration: InputDecoration(
            labelText: AppLocalization.yourName,
            fillColor: Colors.white30,
            filled: true,
            labelStyle: TextStyle(color: AppColors.black),
            contentPadding: EdgeInsets.all(16),
            border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5))));
  }

  _buildPhoneNumber() {
    return TextFormField(
        style: TextStyle(color: AppColors.black),
        onChanged: (value) => _editProfileController.model.phoneNumber = value,
        validator: (_) => _editProfileController.checkPhoneNumber(),
        onFieldSubmitted: (_) => KeyBoard.close(context),
        decoration: InputDecoration(
            labelText: AppLocalization.phoneNumber,
            filled: true,
            fillColor: Colors.white30,
            labelStyle: TextStyle(color: AppColors.black),
            contentPadding: EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5),
            )));
  }

  _buildEmail() {
    return TextFormField(
        style: TextStyle(color: AppColors.black),
        onChanged: (value) => _editProfileController.model.email = value,
        validator: (_) => _editProfileController.checkEmail(),
        onFieldSubmitted: (_) => KeyBoard.close(context),
        decoration: InputDecoration(
            labelText: AppLocalization.email,
            fillColor: Colors.white30,
            filled: true,
            labelStyle: TextStyle(color: AppColors.black),
            contentPadding: EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5),
            )));
  }

  _buildPassword() {
    return Observer(
      builder: (_) => TextFormField(
          style: TextStyle(color: AppColors.black),
          onChanged: (value) => _editProfileController.model.password = value,
          validator: (_) => _editProfileController.checkPassword(),
          obscureText: !_editProfileController.showPassword,
          onFieldSubmitted: (_) => KeyBoard.close(context),
          decoration: InputDecoration(
              labelText: AppLocalization.password,
              fillColor: Colors.white30,
              filled: true,
              labelStyle: TextStyle(color: AppColors.black),
              suffixIcon: GestureDetector(
                onTap: () => _editProfileController.changeViewPassword(),
                child: Icon(_editProfileController.showPassword
                    ? EvaIcons.eye
                    : EvaIcons.eyeOff),
              ),
              contentPadding: EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5),
              ))),
    );
  }

  _buildPasswordConfirm() {
    return Observer(
      builder: (_) => TextFormField(
          style: TextStyle(color: AppColors.black),
          onChanged: (value) => _editProfileController.model.password = value,
          validator: (_) => _editProfileController.checkPassword(),
          obscureText: !_editProfileController.showPassword,
          onFieldSubmitted: (_) => KeyBoard.close(context),
          decoration: InputDecoration(
              labelText: 'تأكيد كلمة المرور',
              fillColor: Colors.white30,
              filled: true,
              labelStyle: TextStyle(color: AppColors.black),
              suffixIcon: GestureDetector(
                onTap: () => _editProfileController.changeViewPassword(),
                child: Icon(_editProfileController.showPassword
                    ? EvaIcons.eye
                    : EvaIcons.eyeOff),
              ),
              contentPadding: EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5),
              ))),
    );
  }

  _buildCityDropDownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String city in cityList) {
      var newItem = DropdownMenuItem(
          child: Text(city, overflow: TextOverflow.ellipsis), value: city);
      dropDownItems.add(newItem);
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('المحافظة', style: TextStyle(color: Colors.black, fontSize: 17)),
        DropdownButton<String>(
            isExpanded: true,
            elevation: 7,
            onChanged: (selectedCity) {
              _editProfileController.selectedCity(selectedCity);
            },
            value: _editProfileController.city,
            items: dropDownItems),
      ],
    );
  }

  _buildUpdateButton() {
    return SizedBox(
        height: 50,
        width: double.infinity,
        child: JRaisedButton(
            onPressed: () async {
              KeyBoard.close(context);
              if (_formKey.currentState.validate()) {
                await _editProfileController.update();
                Navigator.pop(context);
              } else
                _editProfileController.autoValidate = true;
            },
            text: AppLocalization.update));
  }

  _buildProfilePictureSelector() {
    showModalBottomSheet<dynamic>(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: AppColors.BottomPanel,
            child: Container(
                decoration: BoxDecoration(
                    color: AppColors.songItemCard,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                height: 80,
                padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                width: MediaQuery.of(context).size.width,
                child: SafeArea(
                  top: false,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              _openCamera();
                            },
                            child: Column(children: <Widget>[
                              SvgPicture.asset('assets/svg/camera.svg',
                                  color: AppColors.white,
                                  width: 30,
                                  height: 30),
                              SizedBox(height: 5),
                              Text(AppLocalization.camera,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(color: AppColors.white))
                            ])),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              _openGallery();
                            },
                            child: Column(children: <Widget>[
                              SvgPicture.asset('assets/svg/gallery.svg',
                                  color: AppColors.white,
                                  width: 30,
                                  height: 30),
                              SizedBox(height: 5),
                              Text(AppLocalization.gallery,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(color: AppColors.white))
                            ]))
                      ]),
                )),
          );
        });
  }

  _openCamera() {
    KeyBoard.close(context);
    ImagePicker()
        .getImage(source: ImageSource.camera, maxHeight: 200)
        .then((picture) {
      _editProfileController.updateProfilePicture(picture);
    }).catchError((e) {
      Toaster.warning(AppLocalization.openCameraPermission);
    });
  }

  _openGallery() {
    KeyBoard.close(context);
    ImagePicker()
        .getImage(source: ImageSource.gallery, maxHeight: 200)
        .then((picture) {
      _editProfileController.updateProfilePicture(picture);
    }).catchError((e) {
      Toaster.warning(AppLocalization.openGalleryPermission);
    });
  }
}
