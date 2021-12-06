import 'package:flarax/app/core/utils/auth_helper.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/data/models/user_model.dart';
import 'package:flarax/app/modules/profile/widgets/appbar_widget.dart';
import 'package:flarax/app/modules/widgets/button_widget.dart';
import 'package:flarax/app/modules/widgets/profile_widget.dart';
import 'package:flarax/app/modules/profile/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  UserModel? user = authController.firestoreUser.value;

  @override
  Widget build(BuildContext context) {
          return Scaffold(
            appBar: buildAppBar(context),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: user?.photoUrl ?? Const.PHOTOURL,
                  isEdit: true,
                  onClicked: () {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: Const.FULLNAME,
                  text: "${user?.firstname} ${user?.lastname}",
                  onChanged: (name) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: Const.EMAIL,
                  text: "${user?.email}",
                  onChanged: (email) {},
                ),
                const SizedBox(height: 24),
                // TextFieldWidget(
                //   label: 'About',
                //   text: user.about,
                //   maxLines: 5,
                //   onChanged: (about) {},
                // ),
                ButtonWidget(text: Const.SAVE, onClicked: (){})
              ],
            ),
          );
  }
}