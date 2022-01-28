import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_boilerplate/model/news_api_models/Article.dart';
import 'package:flutter_boilerplate/ui/news/bloc/news_bloc.dart';
import 'package:flutter_boilerplate/ui/news/bloc/news_event.dart';
import 'package:flutter_boilerplate/ui/news/bloc/news_state.dart';
import 'package:flutter_boilerplate/utils/app_styles.dart';
import 'package:flutter_boilerplate/utils/app_utils.dart';
import 'package:sizer/sizer.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({Key? key}) : super(key: key);

  static Widget create() {
    return BlocProvider<NewsBloc>(
      create: (_) => NewsBloc()..add(NewsListEvent()),
      child: const NewsListScreen(),
    );
  }

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
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
      appBar: AppBar(
        title: Text(S.of(context).fetchNews),
        backgroundColor:AppStyles.greenColor,
        automaticallyImplyLeading: true,
      ),
      body: BlocListener<NewsBloc, NewsState>(
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
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            List<Article> articleList = state.newsResponse?.articles ?? [];
            return state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppStyles.white,
                    ),
                  )
                : articleList.isNotEmpty
                    ? Container(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.symmetric(vertical: 32.sp),
                          itemCount: articleList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                child: Card(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Image.network(
                                          articleList[index].urlToImage ?? ' ',
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Text(
                                                articleList[index].title ?? '',
                                                style: AppStyles.whiteTextStyle,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Text(
                                                articleList[index]
                                                        .description ??
                                                    '',
                                                style: AppStyles.whiteTextStyle,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {},
                            );
                          },
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 200,
                            child: Center(
                              child: Text("No Articles found!!",
                                style: AppStyles.errorTextStyle,),
                            ),
                          )
                        ],
                      );
          },
        ),
      ),
    );
  }
}
