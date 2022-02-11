import 'dart:async';

import 'package:complete_flutter_app/domain/model/model.dart';
import 'package:complete_flutter_app/presentation/base/baseviewmodel.dart';
import 'package:complete_flutter_app/presentation/resources/string_manager.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs,OnBoardingViewModelOutputs{

  final StreamController _streamController = StreamController<SliderViewObject>();

  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = _currentIndex++;
    if(nextIndex >= _list.length){
      _currentIndex = 0;
    }
    _postDataToView();

    return _currentIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex--;
    if(previousIndex == -1){
      _currentIndex = _list.length-1;
    }
    _postDataToView();

    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();

  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject => _streamController.stream.map((slideViewObject) => slideViewObject);

  List<SliderObject> _getSliderData() =>
      [
        SliderObject(
            AppStrings.onBoardingTitle1, AppStrings.onBoardingSubTitle1),
        SliderObject(
            AppStrings.onBoardingTitle2, AppStrings.onBoardingSubTitle2),
        SliderObject(
            AppStrings.onBoardingTitle3, AppStrings.onBoardingSubTitle3)
      ];

  _postDataToView(){
    inputSliderViewObject.add(SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}

abstract class OnBoardingViewModelInputs{
  void goNext();
  void goPrevious();
  void onPageChanged(int index);

  Sink get inputSliderViewObject; // this is the way to add data to the stream ==> stream input
}

abstract class OnBoardingViewModelOutputs{
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject{
  SliderObject sliderObject;
  int sliderAmount;
  int currentIndex;

  SliderViewObject(this.sliderObject,this.sliderAmount,this.currentIndex);
}