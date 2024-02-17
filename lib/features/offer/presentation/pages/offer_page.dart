import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/offer_constants/offer_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/text_button_widget.dart';
import 'package:resto_admin/features/offer/presentation/pages/add_offer_page.dart';
import 'package:resto_admin/features/offer/presentation/widgets/offer_banner_widget.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final theme = AppTheme.of(context);
    final OfferPageConstants constants = OfferPageConstants();

    return Scaffold(
      backgroundColor: theme.colors.secondary,

      appBar: AppBar(
        backgroundColor: theme.colors.secondary,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(
            left: spaces.space_100,
          ),
          child: Text(constants.txtAppbarTitle,
              style: AppTheme.of(context).typography.h800),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: spaces.space_300),
            child: TextButtonWidget(
                onTap: () {
                  context.push(AddOfferPage.routePath);
                },
                buttonText: constants.txtAddOfferText,
                color: color.primary),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: spaces.space_400),
        child: SizedBox(
          child: OfferBannerWidget(
            offerImage: const NetworkImage(
                'https://i.pinimg.com/originals/80/1b/5d/801b5da41f2abd03df3941b5f6ed35bc.jpg'),
            offerText: constants.txtOfferText,
          ),
        ),
      ),
    );
  }
}
