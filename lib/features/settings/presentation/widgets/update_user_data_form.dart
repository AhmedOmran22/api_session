import 'package:api_session/core/utils/app_colors.dart';
import 'package:api_session/core/widgets/general_button.dart';
import 'package:api_session/core/widgets/password_field.dart';
import 'package:api_session/features/settings/presentation/cubits/update_password_cubit.dart';
import 'package:api_session/features/settings/presentation/cubits/update_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/show_snack_bar_funnction.dart';
import '../../../auth/data/models/update_password_requset_model.dart';

class UpdatePasswordForm extends StatefulWidget {
  const UpdatePasswordForm({super.key});

  @override
  State<UpdatePasswordForm> createState() => _UpdatePasswordFormState();
}

class _UpdatePasswordFormState extends State<UpdatePasswordForm> {
  late TextEditingController oldPasswordController,
      newPasswordController,
      rePasswordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();

    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    rePasswordController = TextEditingController();
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 16,
        children: [
          PasswordField(
            controller: oldPasswordController,
            hintText: "Current password",
          ),
          PasswordField(
            controller: newPasswordController,
            hintText: "new password",
          ),
          PasswordField(
            controller: rePasswordController,
            hintText: "Re enter password",
          ),
          BlocConsumer<UpdatePasswordCubit, UpdatePasswordStates>(
            listener: (context, state) {
              if (state is UpdatePasswordFailure) {
                showSnackBarFuction(context, state.errMessage);
              }
              if (state is UpdatePasswordSuccess) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return GeneralButton(
                text: "Update Password",
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (newPasswordController.text ==
                        rePasswordController.text) {
                      UpdatePasswordRequsetModel
                      updatePasswordRequestModel =
                          UpdatePasswordRequsetModel(
                            oldPassword: oldPasswordController.text,
                            newPassword: newPasswordController.text,
                          );

                      context.read<UpdatePasswordCubit>().updatePassword(
                        updatePasswordRequsetModel:
                            updatePasswordRequestModel,
                      );
                    } else {
                      showSnackBarFuction(
                        context,
                        "Password doesn't match",
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
