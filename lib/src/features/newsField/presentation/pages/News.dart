import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../../core/services/NetworkData.dart';
import '../controllers/news_controller.dart';
import '../widgets/NewsBody.dart';
import '../widgets/newsappbar.dart';

class NewsField extends StatelessWidget {
  const NewsField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsController = Get.put(NewsController(networkInfo: NetworkInfoImpl(Connectivity())));
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.1),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: SafeArea(
            child: newsappBar(
              'News Articles',
              () {},
              height,
              width,
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (newsController.isLoading.value) {
          return _buildShimmerListView();
        } else {
          return RefreshIndicator(
            onRefresh: newsController.refreshData,
            child: _buildContent(newsController),
          );
        }
      }),
    );
  }

  Widget _buildShimmerListView() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 200,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 16,
                  width: 200,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 16,
                  width: 150,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 12,
                  width: 100,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(NewsController newsController) {
    if (newsController.isOffline.value) {
      return ListView(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'No internet connection. Swipe down to refresh.',
                style: _getTextStyle(newsController),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          if (newsController.showOfflineMessage.value)
            _buildShimmerListView(), // Show shimmer while offline and loading
        ],
      );
    } else if (newsController.newsList.isEmpty) {
      return ListView(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'No data available. Swipe down to refresh.',
                style: _getTextStyle(newsController),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      );
    } else {
      return ListView.builder(
        itemCount: newsController.newsList.length,
        itemBuilder: (context, index) {
          final article = newsController.newsList[index];
          return NewsBody(article: article);
        },
      );
    }
  }

  TextStyle _getTextStyle(NewsController newsController) {
    // Check internet connection
    if (newsController.isOffline.value) {
      // Use a fallback font when offline
      return TextStyle(fontSize: 16);
    } else {
      // Use Google Fonts when online
      return GoogleFonts.nunitoSans(fontSize: 16);
    }
  }
}
