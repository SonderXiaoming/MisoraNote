import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FadeSlideScaleTransitionPage<T> extends CustomTransitionPage<T> {
  FadeSlideScaleTransitionPage({
    required super.child,
    Duration duration = const Duration(milliseconds: 500),
  }) : super(
         transitionDuration: duration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           final offsetTween = Tween<Offset>(
             begin: const Offset(0.3, 0),
             end: Offset.zero,
           );
           return FadeTransition(
             opacity: animation,
             child: SlideTransition(
               position: offsetTween.animate(animation),
               child: ScaleTransition(
                 scale: Tween<double>(begin: 0.95, end: 1.0).animate(animation),
                 child: child,
               ),
             ),
           );
         },
       );
}
