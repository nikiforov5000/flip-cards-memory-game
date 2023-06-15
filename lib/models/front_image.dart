import 'dart:math';

class FrontImage {
  final Random _random = Random();
  final int _quantityOfFrontImages = 18;
  List<bool> _visited = [];
  final Map<int, String> _imagePaths = {};

  FrontImage() {
    _visited = List.generate(_quantityOfFrontImages, (index) => false);
    for (int i = 0; i < _quantityOfFrontImages; ++i) {
      _imagePaths[i] = 'assets/images/cards/front/$i.png';
    }
  }

  String getRandomFrontImage() {
    int index = _random.nextInt(_quantityOfFrontImages);
    while (_visited[index]) {
      index = _random.nextInt(_quantityOfFrontImages);
    }
    _visited[index] = true;
    return _imagePaths[index] ?? '';
  }
}
