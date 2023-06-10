import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_coach/screens/dash.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final advancedDrawerController = AdvancedDrawerController();

    void _handleMenuButtonPressed() {
      // NOTICE: Manage Advanced Drawer state through the Controller.
      // _advancedDrawerController.value = AdvancedDrawerValue.visible();
      advancedDrawerController.showDrawer();
    }

    return AdvancedDrawer(
      backdrop: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            16,
          ),
        ),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 100.0,
                height: 100.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 24.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assests/images/logo.png',
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.person),
                      title: const Text(
                          'Life Coach | Job Coach | Enterpreneurship'),
                    ),

                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.account_balance),
                      title: const Text('Law | Ethics | Compliance | Values'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.leaderboard),
                      title: const Text('Leadership | CSR | Administration'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.business),
                      title:
                          const Text('Buiness Economics | Buiness Statistics'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.account_balance),
                      title: const Text('Accounting | Auditing | Taxation'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.find_replace_rounded),
                      title: const Text('Finance | FP&A | Social Investment'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.inventory),
                      title: const Text('Innovation | Technology'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.point_of_sale),
                      title: const Text('Statergy & Potfolio'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.shopping_bag),
                      title: const Text('Marketing'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.developer_board),
                      title: const Text(
                          'Buiness Devlopemnet | Customer Relationship'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.delivery_dining_rounded),
                      title: const Text('Supply Chain Management | Delivery'),
                    ),
                    // ListTile(
                    //   onTap: () {},
                    //   leading: const Icon(Icons.settings),
                    //   title: const Text('Operations | Logistics'),
                    // ),
                    // ListTile(
                    //   onTap: () {},
                    //   leading: const Icon(Icons.settings),
                    //   title: const Text('Human Resouces Managemnet'),
                    // ),
                    // ListTile(
                    //   onTap: () {},
                    //   leading: const Icon(Icons.settings),
                    //   title: const Text('Mergers & Acquisition | Valuations'),
                    // ),
                    // ListTile(
                    //   onTap: () {},
                    //   leading: const Icon(Icons.settings),
                    //   title: const Text('Recognize | Celebrate | Giving Back'),
                    // ),
                  ],
                ),
              ),
              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: const Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Dashboard",
            style: GoogleFonts.sourceSans3(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              color: Colors.blue,
            ),
          ),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: Center(
          child: Text(
            "Dashboard",
            style: GoogleFonts.pacifico(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
