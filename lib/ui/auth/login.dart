import 'package:flutter_boilerplate/app_screens/app_screens.dart';
import 'package:flutter_boilerplate/bloc/login/login_bloc.dart';
import 'package:flutter_boilerplate/bloc/login/login_event.dart';
import 'package:flutter_boilerplate/bloc/login/login_state.dart';
import 'package:flutter_boilerplate/constants/app_colors.dart';
import 'package:flutter_boilerplate/in_app_purchase.dart';
import 'package:flutter_boilerplate/utils/app_utils.dart';
import 'package:flutter_boilerplate/widgets/app_button.dart';
import 'package:flutter_boilerplate/widgets/app_loading_overlay.dart';
import 'package:flutter_boilerplate/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Widget create() {
    return BlocProvider<LoginBloc>(
      create: (_) => LoginBloc(),
      child: const LoginScreen(),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.isCompleted) {
            if (state.isEmailVerified) {
            //  _navigateToHome(context);
            } else {
              //_navigateToVerifyEmail(context);
            }
          }
          AppUtils.showSnackBar(context, state.error?.getFirstError());
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return AppLoadingOverlay(
              isLoading: state.isLoading,
              child: SafeArea(
                child: InAppPurchaseScreen(),
              ),
            );
          },
        ),
      ),
    );
  }

  void _performLogin() {
   // InAppPurchaseDemoState.initStoreInfo();
    final email = _emailController.text.toString();
    final password = _passwordController.text.toString();
    BlocProvider.of<LoginBloc>(context).add(
      PerformLoginEvent(
        email: email,
        password: password,
      ),
    );
  }
}
