import 'package:flutter/material.dart';
import '../../widgets/general/switcher.dart';
import 'placeholder_screen.dart';

class AppTabs extends StatefulWidget {
  final int bottomTab;
  final int? appBarIndex;

  const AppTabs({
    Key? key,
    required this.bottomTab,
    this.appBarIndex,
  }) : super(key: key);

  @override
  State<AppTabs> createState() => _AppTabsState();
}

class _AppTabsState extends State<AppTabs> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late int _bottomNavIndex;
  int? _appBarTabIndex;
  bool _isAdmin = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.bottomTab);
    _bottomNavIndex = widget.bottomTab;
    _appBarTabIndex = (widget.appBarIndex != null) ? widget.appBarIndex : null;
    // here need to change to switch to user screens
    _isAdmin = true;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: _appBarTabIndex ?? 0,
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
            toolbarHeight: 41,
            backgroundColor: Theme.of(context).canvasColor,
            automaticallyImplyLeading: false,
            // appBar leading
            leading: (_isAdmin && _bottomNavIndex != 2) ||
                    (!_isAdmin && _bottomNavIndex == 1)
                ? Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).primaryColor.withOpacity(0.01),
                      child: Image.asset("assets/logo.png", fit: BoxFit.fill),
                    ),
                  )
                : (_bottomNavIndex == 2)
                    ? IconButton(
                        icon: const Icon(Icons.exit_to_app_outlined, size: 25),
                        color: Colors.amber,
                        disabledColor: Theme.of(context).focusColor,
                        onPressed: () async {
                          setState(() {});
                        },
                      )
                    : null,
            // appBar title
            title: Text(
                textAlign: TextAlign.left,
                (_isAdmin && _bottomNavIndex == 0)
                    ? "Редагування товарів"
                    : (_bottomNavIndex == 1)
                        ? "Каталог"
                        : (_bottomNavIndex == 2)
                            ? "Особистий кабінет"
                            : "Інформація про продавця",
                style: TextStyle(
                    color: Theme.of(context).focusColor, fontSize: 15)),
            // appBar actions
            actions: (_bottomNavIndex == 1)
                ? [
                    (!_isAdmin)
                        ? const SizedBox(child: Text("Sum+Badge"))
                        : const SizedBox(child: Text("Badge"))
                  ]
                : (_isAdmin && _bottomNavIndex == 0)
                    ? [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: IconButton(
                              icon:
                                  const Icon(Icons.article_outlined, size: 30),
                              color: Theme.of(context).focusColor,
                              disabledColor: Theme.of(context).focusColor,
                              onPressed: () {
                                // nextScreen(context, const DiscountSystem());
                              }),
                        )
                      ]
                    : [
                        const SizedBox(
                          child: ThemeSwitcher(),
                        )
                      ],
            // bottom buttons
            bottom: (_isAdmin == true && _bottomNavIndex != 2 ||
                    _isAdmin == false && _bottomNavIndex == 1)
                ? TabBar(
                    unselectedLabelColor: const Color(0xFFFFFFFF),
                    labelColor: const Color.fromARGB(255, 227, 171, 79),
                    onTap: _onAppBarTabTapped,
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Theme.of(context).indicatorColor,
                            width: 1.0),
                      ),
                    ),
                    tabs: const [
                        Tab(text: 'Мед'),
                        Tab(text: 'Інші товари'),
                      ])
                : null),

        // body of Scaffold next
        body: Align(
            alignment:
                (_bottomNavIndex == 2) ? Alignment.center : Alignment.topCenter,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _bottomNavIndex = index;
                });
              },
              children: _isAdmin
                  ? [
                      const PlaceholderScreen(number: 0),
                      // AdminsListOfProducts(
                      //     categoryOfProducts: _appBarTabIndex!),
                      const PlaceholderScreen(number: 1),
                      // (_appBarTabIndex == 0)
                      // ? const ProductsGrid(true)
                      //     : const ProductsGrid(false),
                      const PlaceholderScreen(number: 2)
                      // const SellersInfo(),
                      //
                    ]
                  : [
                      const PlaceholderScreen(number: 0),
                      // const SellersInfo(),
                      const PlaceholderScreen(number: 1),
                      // (_appBarTabIndex == 0)
                      //     ? const ProductsGrid(true)
                      //     : const ProductsGrid(false),
                      const PlaceholderScreen(number: 2)
                      // const PersonalCabinet4Customer(),
                    ],
            )),
        //
        // bottom navigation part next
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).canvasColor,
          currentIndex: _bottomNavIndex,
          onTap: _onBottomNavTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 25,
          items: [
            BottomNavigationBarItem(
              icon: _isAdmin
                  ? const Icon(Icons.edit)
                  : const Icon(Icons.info_outlined),
              label: 'Edit Screen',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home Screen',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: 'Personal cabinet',
            )
          ],
        ),
      ),
    );
  }

  // List<Widget> actions = [];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onAppBarTabTapped(int index) {
    setState(() {
      _appBarTabIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  //
}
