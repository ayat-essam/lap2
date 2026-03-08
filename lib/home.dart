import 'package:flutter/material.dart';
import 'package:lap2/card_info.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedTab = 0;
  int _bottomNavIndex = 2;

  final List<CardInfo> cards = [
    CardInfo(
      name: 'برج خليفة',
      description:
      'أطول مبنى في العالم، يقع في دبي ويوفر إطلالات رائعة.',
      price: '150',
      currency: 'درهم',
      imageUrl: 'images/burjKhalifa.jpg',
    ),

    CardInfo(
      name: 'أهرامات الجيزة',
      description:
      'إحدى عجائب الدنيا السبع القديمة وتعكس الحضارة المصرية.',
      price: '200',
      currency: 'جنيه',
      imageUrl: 'images/pyramids.jpg',
    ),

    CardInfo(
      name: 'تاج محل',
      description:
      'ضريح رائع من الرخام الأبيض في الهند.',
      price: '45',
      currency: 'دولار',
      imageUrl: 'images/QasrBaroon.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        appBar: AppBar(
          title: const Text("أهم المعالم السياحية"),
          centerTitle: true,
        ),

        body: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                TextButton(
                  onPressed: (){
                    setState(() {
                      _selectedTab = 0;
                    });
                  },
                  child: const Text("قائمة"),
                ),

                TextButton(
                  onPressed: (){
                    setState(() {
                      _selectedTab = 1;
                    });
                  },
                  child: const Text("شبكة"),
                ),

              ],
            ),

            Expanded(
              child: _selectedTab == 0
                  ? _buildListView()
                  : _buildGridView(),
            )

          ],
        ),

        bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }


  Widget _buildListView(){
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: cards.length,
      itemBuilder: (context,index){
        return cards[index];
      },
    );
  }


  Widget _buildGridView(){
    return GridView.builder(
      padding: const EdgeInsets.all(16),

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),

      itemCount: cards.length,

      itemBuilder: (context,index){
        return cards[index];
      },
    );
  }


  Widget _buildBottomNavBar(){

    final items = [
      {'icon': Icons.home_outlined, 'label': 'الرئيسية'},
      {'icon': Icons.explore_outlined, 'label': 'استكشاف'},
      {'icon': Icons.favorite_border, 'label': 'المفضلة'},
      {'icon': Icons.person_outline, 'label': 'حسابي'},
    ];

    return BottomNavigationBar(
      currentIndex: _bottomNavIndex,
      onTap: (i){
        setState(() {
          _bottomNavIndex = i;
        });
      },

      type: BottomNavigationBarType.fixed,

      items: items.map((item) =>
          BottomNavigationBarItem(
            icon: Icon(item['icon'] as IconData),
            label: item['label'] as String,
          )
      ).toList(),
    );
  }

}