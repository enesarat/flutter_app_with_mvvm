import 'package:complete_flutter_app/domain/model.dart';
import 'package:complete_flutter_app/presentation/onboarding/onboarding_viewmodel.dart';
import 'package:complete_flutter_app/presentation/resources/color_manager.dart';
import 'package:complete_flutter_app/presentation/resources/routes_manager.dart';
import 'package:complete_flutter_app/presentation/resources/string_manager.dart';
import 'package:complete_flutter_app/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController _pageController = PageController(initialPage: 0);
  OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
        stream: _viewModel.outputSliderViewObject,
        builder: (context, snapshot) {
          return _getContentWidget(snapshot.data);
        }
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    }
    else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          elevation: AppSize.s0,
          backgroundColor: ColorManager.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: sliderViewObject.sliderAmount,
          onPageChanged: (index) {
            _viewModel.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(sliderViewObject.sliderObject);
          },
        ),
        bottomSheet: Container(
          color: ColorManager.white,
          height: AppSize.s100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Text(AppStrings.skip, textAlign: TextAlign.end,
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle2,
                  ),
                ),
              ),
              _buildBottomSheetWidget(sliderViewObject)
            ],
          ),
        ),
      );
    }
  }

  Widget _buildBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // LEFT ARROW
          Padding(padding: EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                  child: SizedBox(
                    height: AppSize.s20,
                    width: AppSize.s20,
                    child: Icon(
                      Icons.chevron_left, color: ColorManager.white,
                    ),
                  ),
                  onTap: () {
                    _pageController.animateToPage(_viewModel.goPrevious(),
                        duration: Duration(milliseconds: DurationConstant.d300),
                        curve: Curves.bounceInOut);
                  }
              )
          ),

          Row(
            children: [
              for(int i = 0; i < sliderViewObject.sliderAmount; i++)
                Padding(padding: EdgeInsets.all(AppPadding.p8),
                  child: _getCurrentCircle(i, sliderViewObject.currentIndex),
                ),

            ],
          ),
          // RIGHT ARROW
          Padding(padding: EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                  child: SizedBox(
                    height: AppSize.s20,
                    width: AppSize.s20,
                    child: Icon(
                      Icons.chevron_right, color: ColorManager.white,
                    ),
                  ),
                  onTap: () {
                    _pageController.animateToPage(_viewModel.goNext(),
                        duration: Duration(milliseconds: DurationConstant.d300),
                        curve: Curves.bounceInOut);
                  }
              )
          )
        ],
      ),
    );
  }

  Widget _getCurrentCircle(int index, int _currentIndex) {
    if (index == _currentIndex) {
      return Icon(Icons.circle, color: ColorManager.white, size: AppSize.s14,);
    }
    else {
      return Icon(
          Icons.radio_button_off, color: ColorManager.white, size: AppSize.s12);
    }
  }
}



class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;
  OnBoardingPage(this._sliderObject,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height:AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.title,textAlign: TextAlign.center,style: Theme.of(context).textTheme.headline1,),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.subTitle,textAlign: TextAlign.center,style: Theme.of(context).textTheme.subtitle1,),
        ),
        SizedBox(height:AppSize.s60),
      ],
    );
  }
}

