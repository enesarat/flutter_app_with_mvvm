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
  late final List<SliderObject> _list = _getSliderData();
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  List<SliderObject> _getSliderData() =>
      [
        SliderObject(
            AppStrings.onBoardingTitle1, AppStrings.onBoardingSubTitle1),
        SliderObject(
            AppStrings.onBoardingTitle2, AppStrings.onBoardingSubTitle2),
        SliderObject(
            AppStrings.onBoardingTitle3, AppStrings.onBoardingSubTitle3)
      ];

  @override
  Widget build(BuildContext context) {
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
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return OnBoardingPage(_list[index]);
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
                  style: Theme.of(context)
                    .textTheme
                    .subtitle2,
                ),
              ),
            ),
            _buildBottomSheetWidget()
          ],
        ),
      ),
    );
  }


  Widget _buildBottomSheetWidget() {
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
                        Icons.chevron_left,color: ColorManager.white,
                    ),
                  ),
                  onTap: () {
                    _pageController.animateToPage(_getPreviousIndex(), duration: Duration(milliseconds:DurationConstant.d300),
                        curve: Curves.bounceInOut);
                  }
              )
          ),

          Row(
            children: [
              for(int i = 0; i < _list.length;i++)
                Padding(padding: EdgeInsets.all(AppPadding.p8),
                  child: _getCurrentCircle(i),
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
                        Icons.chevron_right,color: ColorManager.white,
                    ),
                  ),
                  onTap: () {
                    _pageController.animateToPage(_getNextIndex(), duration: Duration(milliseconds:DurationConstant.d300),
                        curve: Curves.bounceInOut);
                  }
              )
          )
        ],
      ),
    );
  }

  int _getPreviousIndex(){
    int previousIndex = _currentIndex--;
    if(previousIndex == -1){
      _currentIndex = _list.length-1;
    }
    return _currentIndex;
  }
  int _getNextIndex(){
    int nextIndex = _currentIndex++;
    if(nextIndex >= _list.length){
      _currentIndex = 0;
    }
    return _currentIndex;
  }

  Widget _getCurrentCircle(int index){
    if(index==_currentIndex) {
      return Icon(Icons.circle,color: ColorManager.white,size:AppSize.s14,);
    }
    else
    {
      return Icon(Icons.radio_button_off,color: ColorManager.white,size:AppSize.s12);
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

class SliderObject{
  String title;
  String subTitle;
  //String image;
  SliderObject(this.title,this.subTitle);
}
