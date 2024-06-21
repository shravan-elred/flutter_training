import 'dart:math';

import 'package:flutter/material.dart';

import 'clippers/add_oval_clipper.dart';
import 'clippers/add_path_clipper.dart';
import 'clippers/add_polygon_clipper.dart';
import 'clippers/add_r_rect_clipper.dart';
import 'clippers/add_rect_clipper.dart';
import 'clippers/arc_to_clipper.dart';
import 'clippers/arc_to_point_clipper.dart';
import 'clippers/banner_custom_clipper.dart';
import 'clippers/cubic_to_clipper.dart';
import 'clippers/line_to_clipper.dart';
import 'clippers/move_to_clipper.dart';
import 'clippers/quadratic_bezier_to_clipper.dart';
import 'clippers/relative_line_to.dart';

class CustomClipperExample extends StatelessWidget {
  const CustomClipperExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom clipper'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: LineToClipper(),
              child: const BaseContainer(),
            ),
            const SizedBox(height: 20),
            ClipPath(
              clipper: MoveToClipper(),
              child: const BaseContainer(),
            ),
            const SizedBox(height: 20),
            ClipPath(
              clipper: QuadraticBezierToClipper(),
              child: const BaseContainer(),
            ),
            const SizedBox(height: 20),
            ClipPath(
              clipper: CubicToClipper(),
              child: const BaseContainer(),
            ),
            const SizedBox(height: 20),
            ClipPath(
              clipper: ArcToPointClipper(),
              child: const BaseContainer(),
            ),
            const SizedBox(height: 20),
            ClipPath(
              clipper: ArcToClipper(),
              child: const BaseContainer(),
            ),
            const SizedBox(height: 20),
            ClipPath(
              clipper: AddRectClipper(),
              child: const BaseContainer(),
            ),
            const SizedBox(height: 20),
            ClipPath(
              clipper: AddRRectClipper(),
              child: const BaseContainer(),
            ),
            const SizedBox(height: 20),
            ClipPath(
              clipper: AddOvalClipper(),
              child: const BaseContainer(),
            ),
            const SizedBox(height: 20),
            ClipPath(
              clipper: AddPolygonClipper(),
              child: const BaseContainer(),
            ),
            const SizedBox(height: 20),
            ClipPath(
              clipper: AddPathClipper(),
              child: const BaseContainer(),
            ),
            const SizedBox(height: 20),
            ClipPath(
              clipper: RelativeLineTo(),
              child: const BaseContainer(),
            ),
            const SizedBox(height: 20),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 200,
                    height: 300,
                    color: Colors.red,
                  ),
                  const Positioned(
                    right: -(100 * 0.2),
                    top: 100 * 0.2,
                    child: CustomBannerWidget(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.blue,
    );
  }
}

class CustomBannerWidget extends StatelessWidget {
  const CustomBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 45 * pi / 180,
      child: ClipPath(
        clipper: BannerCustomClipper(),
        child: Container(
          width: 100,
          height: 20,
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Center(
            child: Text(
              'New',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
