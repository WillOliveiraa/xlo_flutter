import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xlo_flutter/core/pages/auth/auth_controller.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';
import 'package:xlo_flutter/core/shared/widgets/button_default.dart';

class CreateAdButton extends StatefulWidget {
  const CreateAdButton(this.scrollController);

  final ScrollController scrollController;

  @override
  _CreateAdButtonState createState() => _CreateAdButtonState();
}

class _CreateAdButtonState extends State<CreateAdButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> buttonAnimation;
  final authController = Modular.get<AuthController>();

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    buttonAnimation = Tween<double>(begin: 0, end: 66).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.4, 0.6),
      ),
    );

    widget.scrollController.addListener(scrollChanged);
  }

  void scrollChanged() {
    final s = widget.scrollController.position;
    if (s.userScrollDirection == ScrollDirection.forward) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: buttonAnimation,
      builder: (_, __) {
        return FractionallySizedBox(
          widthFactor: 0.6,
          child: Container(
            height: 50,
            margin: EdgeInsets.only(bottom: buttonAnimation.value),
            child: ButtonDefault(
              primaryColor: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  Icon(Icons.camera_alt, color: Colors.white),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Anunciar agora',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                if (authController.isLoggedIn) {
                  Modular.to.pushNamed(
                    '$baseRouter$saveAdRouter'.replaceAll('//', '/'),
                  );
                } else
                  Modular.to.pushNamed(signInRouter);
              },
            ),
          ),
        );
      },
    );
  }
}
