import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:jojo_taxi/components/app_bar/app_bar_with_back.dart';
import 'package:jojo_taxi/components/btn/jojo_btn.dart';
import 'package:jojo_taxi/components/customs/jojo_confirm_dialog.dart';
import 'package:jojo_taxi/components/customs/jojo_dialog.dart';
import 'package:jojo_taxi/components/jojo_text.dart';
import 'package:jojo_taxi/components/text_field/jojo_text_field.dart';
import 'package:jojo_taxi/domain/model/pass_model.dart';
import 'package:jojo_taxi/domain/repository/auth_repository.dart';
import 'package:jojo_taxi/persentation/resources/color_manager.dart';
import 'package:jojo_taxi/persentation/resources/routes_manager.dart';
import 'package:jojo_taxi/persentation/resources/style_manager.dart';
import 'package:jojo_taxi/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPassController = TextEditingController();
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  late bool currentPassVisibility = true;
  late bool newPassVisibility = true;
  late bool confirmPassVisibility = true;

  final PasswordModal passwordModal = PasswordModal();

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(Constants.prefsToken);
    print(token);
  }

  void handleSave() {
    if (_formKey.currentState!.validate()) {
      if(_newPassController.text == _confirmPassController.text){
        setState(() {
          passwordModal.currentPass = _currentPassController.text;
          passwordModal.newPass = _newPassController.text;
        });
        showDialog(
            context: context,
            builder: (_) => JoJoConfirmDialog(
                context: context,
                message: "Are you sure do you want to change password",
                type: Constants.success,
                title: "Reset Password ?",
                action: () => changePassHandler()));
      }else{
        showDialog(
            context: context,
            builder: (_) => JoJoDialog(
                context: context,
                message: "Passwords are not match",
                type: Constants.error));
      }

    }
  }

  void changePassHandler() {
    Provider.of<AuthRepository>(context, listen: false)
        .changePassword(passwordModal)
        .then(_onSuccess)
        .catchError(_onError);
  }

  void _onSuccess(value) async {
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
    showDialog(
        context: context,
        builder: (_) => JoJoDialog(
            context: context,
            message: "You password has been reset successfully.",
            type: Constants.success));
  }

  void _onError(value) {
    print(value);
    showDialog(
        context: context,
        builder: (_) => JoJoDialog(
            context: context,
            message: value.toString(),
            type: Constants.error));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBarWithBack(
          onBack: () => {Navigator.pop(context)}, title: "Change Password"),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  JoJoTextField(
                      controller: _currentPassController,
                      hint: "Current Password",
                      isPass: currentPassVisibility,
                      isLeading: true,
                      leading: Icon(
                        Icons.lock,
                        color: ColorManager.primary,
                      ),
                      trailing: InkWell(
                          onTap: () {
                            setState(() {
                              currentPassVisibility = !currentPassVisibility;
                            });
                          },
                          child: Icon(
                            currentPassVisibility
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: ColorManager.grey,
                          )),
                      validationBuilder: ValidationBuilder().minLength(6)),
                  const SizedBox(
                    height: 15,
                  ),
                  JoJoTextField(
                      controller: _newPassController,
                      hint: "New Password",
                      isPass: newPassVisibility,
                      isLeading: true,
                      leading: Icon(
                        Icons.lock,
                        color: ColorManager.primary,
                      ),
                      trailing: InkWell(
                          onTap: () {
                            setState(() {
                              newPassVisibility = !newPassVisibility;
                            });
                          },
                          child: Icon(
                            newPassVisibility
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: ColorManager.grey,
                          )),
                      validationBuilder: ValidationBuilder().minLength(6)),
                  const SizedBox(
                    height: 15,
                  ),
                  JoJoTextField(
                      controller: _confirmPassController,
                      hint: "Confirm Password",
                      isPass: confirmPassVisibility,
                      isLeading: true,
                      leading: Icon(
                        Icons.lock,
                        color: ColorManager.primary,
                      ),
                      trailing: InkWell(
                          onTap: () {
                            setState(() {
                              confirmPassVisibility = !confirmPassVisibility;
                            });
                          },
                          child: Icon(
                            confirmPassVisibility
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: ColorManager.grey,
                          )),
                      validationBuilder: ValidationBuilder().minLength(6)),
                ],
              ),
              JoJoBtn(
                  text: "Save",
                  onPressed: () => {handleSave()},
                  color: ColorManager.primary)
            ],
          ),
        ),
      )),
    );
  }
}
