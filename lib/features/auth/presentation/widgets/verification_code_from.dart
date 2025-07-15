import 'package:api_session/features/auth/presentation/cubits/verficy_code_cubit/verify_code_cubit.dart';
import 'package:api_session/features/auth/presentation/cubits/verficy_code_cubit/verify_code_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/show_snack_bar_funnction.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/general_button.dart';

class VerficationCodeForm extends StatefulWidget {
  const VerficationCodeForm({super.key});

  @override
  State<VerficationCodeForm> createState() => _VerficationCodeFormState();
}

class _VerficationCodeFormState extends State<VerficationCodeForm> {
  late TextEditingController codeController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    codeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    codeController.dispose();
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
          CustomTextFormField(
            hintText: "code",
            controller: codeController,
            textInputType: TextInputType.phone,
          ),
          BlocConsumer<VerifyCodeCubit, VerifyCodeStates>(
            listener: (context, state) {
              if (state is VerifyCodeFailure) {
                showSnackBarFuction(context, state.errMessage);
              }
              if (state is VerifyCodeSuccess) {
                Navigator.pushNamed(context, AppRoutes.resetPassword);
              }
            },
            builder: (context, state) {
              if (state is VerifyCodeLoading) {
                return const CircularProgressIndicator();
              }
              return GeneralButton(
                onPressed: () {
                  _hanldeVerfiyCode(context);
                },
                text: "Send Code",
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
              );
            },
          ),
        ],
      ),
    );
  }

  void _hanldeVerfiyCode(BuildContext context) {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<VerifyCodeCubit>(
        context,
      ).verfiyCode(code: codeController.text);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
