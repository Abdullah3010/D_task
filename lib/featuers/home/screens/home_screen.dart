import 'package:d_task/config/app_assets.dart';
import 'package:d_task/config/app_colors.dart';
import 'package:d_task/widget/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.homeScreenImage,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Upload\nHistopathological image',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: 200,
                child: Text(
                  'You can upload the Histopathological Image on this page to see if there is a breast cancer or not.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              MaterialButton(
                onPressed: () {
                  _showLoadingDialog(context);
                },
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: AppColors.primaryO100,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.uploadIcon,
                        height: 25,
                        width: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Upload',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        content: LoadingWidget(
          onEnd: () async {
            await Future.delayed(
              const Duration(seconds: 1),
            );
            Navigator.of(context).pop();
            _showImageDialog(context);
          },
        ),
      ),
    );
  }

  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 0.0,
        content: SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(
                child: Text(
                  'The result is:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Bengin',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
