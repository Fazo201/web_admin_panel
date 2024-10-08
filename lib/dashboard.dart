import 'package:flutter/material.dart';
import 'package:responsive_dashboard_admin/pages/home/home_page.dart';
import 'package:responsive_dashboard_admin/responsive.dart';
import 'package:responsive_dashboard_admin/widgets/menu.dart';
import 'package:responsive_dashboard_admin/widgets/profile/profile.dart';

class DashBoard extends StatelessWidget {
  DashBoard({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer:!Responsive.isDesktop(context) ? SizedBox(width: 250,
        child: Menu(scaffoldKey: _scaffoldKey)) :null,
        endDrawer:Responsive.isMobile(context) ? SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: const Profile()) : null,
        body: SafeArea(
          child: Row(
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 3,
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Menu(scaffoldKey: _scaffoldKey)),
                ),
              Expanded(flex: 8, child: HomePage(scaffoldKey: _scaffoldKey)),
              if (!Responsive.isMobile(context))
                const Expanded(
                  flex: 4,
                  child: Profile(),
                ),
            ],
          ),
        ));
  }
}
