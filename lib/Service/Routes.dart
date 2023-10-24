import 'dart:js';

import 'package:beamer/beamer.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_club_blaga/Pages/error_page.dart';
import 'package:flutter_club_blaga/Pages/product_detailed.dart';

import '../Pages/example.dart';
import '../Pages/homepage.dart';
import '../Pages/shop_page.dart';

final routerDelegate = BeamerDelegate(
  initialPath: '/home',
  notFoundPage: BeamPage(
    key: const ValueKey('ErrorPage'),
    title: 'Not found',
    child: ErrorPage(),
  ),
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/home': (context, state, data) {
        return BeamPage(
          key: const ValueKey("home_page"),
          title: 'Chief Sosa',
          child: HomePage(),
        );
      }, //sunt fullstack acum
      '/example': (context, state, data) {
        return const BeamPage(
          key: ValueKey("example"),
          title: 'Zdroba bss',
          child: ExamplePage(),
        );
      },
      '/shop': (context, state, data) {
        return BeamPage(
          key: const ValueKey("shop"),
          title: 'Shop Page',
          child: ShopPage(),
        );
      },
      '/shop/:product':(context, state, data){
        final product = state.pathParameters['product'];
        if(product!.contains('product'))
          {
            return BeamPage(
              key: ValueKey('Shop-$product'),
              title: 'Shop - $product',
              popToNamed: '/shop',
              child: ProductDetailed(),
            );
          }
        else {
          return BeamPage(
            key: const ValueKey('ErrorPage'),
            title: 'Error',
            child: ErrorPage(),
          );

        }
      },
    },
  ),
);