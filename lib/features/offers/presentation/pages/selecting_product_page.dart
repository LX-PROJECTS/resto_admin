import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/constants/offer_constants/selecting_product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/gridview_widget.dart';
import 'package:resto_admin/core/widgets/listview_seperated_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_8_widget.dart';
// import 'package:resto_admin/features/offers/presentation/widgets/rounded_checkbox_widget.dart';

class OfferSelectingPage extends ConsumerWidget {
  // static const routePath = '/select';
  static const routePath = '/';
  const OfferSelectingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    final constants = SelectingProductPageConstants();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: apptheme.colors.secondary,
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/ic_arrow_backward.svg'),
            ),
            Text(
              constants.txtAppbarTitle,
              style: apptheme.typography.h700
                  .copyWith(color: apptheme.colors.text),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(constants.txtSelectAllText),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(
                height: apptheme.spaces.space_400,
                child: Row(
                  children: [
                    Text(
                      constants.txtTitleCategories,
                      style: apptheme.typography.h500
                          .copyWith(color: apptheme.colors.text),
                    ),
                  ],
                ),
              ),
              const SizedBox8Widget(),
              SizedBox(
                  height: MediaQuery.sizeOf(context).height / 10,
                  width: MediaQuery.sizeOf(context).width,
                  child: ListViewSeparatedWidget(
                    text: constants.txtListtext,
                  )),
              const SizedBox(
                  child: Stack(children: [
                GridViewWidget(),
              ]))
            ],
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButtonWidget(text: "Save", onPressed: () {}),
    );
  }
}
