import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/num_extensions.dart';
import '../../../core/resources/custom_icons.dart';
import '../../../core/widgets/custom_icon.dart';
import '../../../core/widgets/main_appbar.dart';
import '../../cart/view_models/cart_viewmodel/cart_viewmodel.dart';
import '../../products/viewmodels/products_viewmodel/products_viewmodel.dart';
import '../viewmodels/layout_viewmodel/layout_states.dart';
import '../viewmodels/layout_viewmodel/layout_view_model.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late final ProductsViewModel productsViewModel;
  late final CartViewModel cartViewModel;

  @override
  void initState() {
    productsViewModel = BlocProvider.of<ProductsViewModel>(context);
    cartViewModel = BlocProvider.of<CartViewModel>(context);
    productsViewModel.getHome();
    cartViewModel.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final layoutVM = BlocProvider.of<LayoutViewModel>(context);
    return Scaffold(
      appBar: const MainAppbar(),
      body: BlocBuilder<LayoutViewModel, LayoutStates>(
        buildWhen: (prevState, state) => state is SetScreenIndexState,
        builder: (context, state) {
          return layoutVM.screens[layoutVM.currentScreenIndex];
        },
      ),
      bottomNavigationBar: BlocBuilder<LayoutViewModel, LayoutStates>(
        buildWhen: (prevState, state) => state is SetScreenIndexState,
        builder: (context, state) => ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0.r)),
          child: BottomNavigationBar(
            currentIndex: layoutVM.currentScreenIndex,
            onTap: layoutVM.setCurrentScreenIndex,
            items: const [
              BottomNavigationBarItem(
                icon: CustomIcon(CustomIcons.iconly_light_outline_home),
                activeIcon: CustomIcon(CustomIcons.iconly_bold_home),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: CustomIcon(CustomIcons.iconly_light_outline_buy),
                activeIcon: CustomIcon(CustomIcons.iconly_bold_buy),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: CustomIcon(CustomIcons.iconly_light_outline_category),
                activeIcon: CustomIcon(CustomIcons.iconly_bold_category),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: CustomIcon(CustomIcons.iconly_light_outline_profile),
                activeIcon: CustomIcon(CustomIcons.iconly_bold_profile),
                label: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
