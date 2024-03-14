import 'package:mvvm_project/model/product_model/product.dart';
import 'package:mvvm_project/services/product_services.dart';
import 'package:stacked/stacked.dart';

class ScreenHome_ViewModel extends BaseViewModel {
  ApiServices apiServices=ApiServices();
  List<Product> plist=[];
  Future<void> Fetch() async {
    plist=(await apiServices.fetchData())!;
    notifyListeners();
  }
}
