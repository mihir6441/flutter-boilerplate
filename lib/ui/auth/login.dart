import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app_screens/app_screens.dart';
import 'package:flutter_boilerplate/constants/app_colors.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_boilerplate/utils/app_utils.dart';
import 'package:flutter_boilerplate/widgets/app_loading_overlay.dart';
import 'package:sizer/sizer.dart';

import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

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
                /// for In app purchase demo
                // child: InAppPurchaseScreen(),
                /// for news listing API demo
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppScreens.newsList);
                        },
                        child: Text(
                          S.of(context).fetchNews,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppScreens.postList);
                        },
                        child: Text(
                          S.of(context).fetchPosts,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppScreens.clipList);
                          // Navigator.pushNamed(context, AppScreens.notificationExample);
                        },
                        child: Text(
                          S.of(context).fetchClips,
                          //S.of(context).notificationExample,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
