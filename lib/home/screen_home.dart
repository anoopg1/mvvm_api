import 'package:flutter/material.dart';
import 'package:mvvm_project/home/screen_home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ScreenHome_ViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.Fetch();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          body: ListView.separated(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              viewModel.plist[index].thumbnail.toString()),
                        ),
                      ),
                    ),
                    Text(
                      viewModel.plist[index].price.toString(),
                    ),
                    Text(
                      viewModel.plist[index].brand.toString(),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: viewModel.plist.length),
        );
      },
    );
  }
}
