import 'package:flutter/material.dart';
import 'package:gojek/beranda/beranda_gojek_appbar.dart';
import 'package:gojek/constant.dart';
import 'package:gojek/beranda/beranda_model.dart';

List<GojekService> _gojekServiceList = [];
List<Food> _goFoodFeaturedList = [];

class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BuildGopayMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
            ),
            borderRadius: BorderRadius.all(Radius.circular(3.0))),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3.0),
                      topRight: Radius.circular(3.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "GOPAY",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: "NeoSansBold"),
                  ),
                  Container(
                    child: Text(
                      "Rp. 100.000.000",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontFamily: "NeoSansBold"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 32.0, right: 32.0, top: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/icons/icon_transfer.png",
                        width: 32.0,
                        height: 32.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "Transfer",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/icons/icon_scan.png",
                        width: 32.0,
                        height: 32.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "Scan QR",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/icons/icon_saldo.png",
                        width: 32.0,
                        height: 32.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "Isi Saldo",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/icons/icon_menu.png",
                        width: 32.0,
                        height: 32.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "Lainnya",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class _BuildGojekServicesMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 200.0,
        child: Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: GridView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, position) {
                  return _RowGojekService(_gojekServiceList[position]);
                })));
  }
}

class _BuildGoFoodFeatured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "GO-FOOD",
              style: TextStyle(fontFamily: "NeoSansBold"),
            ),
            Padding(padding: EdgeInsets.only(top: 8.0)),
            Text(
              "Pilihan Terlaris",
              style: TextStyle(fontFamily: "NeoSansBold"),
            ),
            SizedBox(
              height: 172.0,
              child: FutureBuilder<List>(
                future: fetchFood(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: _goFoodFeaturedList.length,
                        padding: EdgeInsets.only(top: 12.0),
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return _RowGoFoodFeatured(_goFoodFeaturedList[index]);
                        });
                  }
                  return Center(
                    child: SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: const CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}

class _BuildMenuBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (c, s) {
      return SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0), color: Colors.white),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.drag_handle,
                color: GojekPalette.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("GO-JEK Services",
                      style:
                          TextStyle(fontFamily: "NeoSansBold", fontSize: 18.0)),
                  OutlineButton(
                    color: GojekPalette.green,
                    onPressed: () {},
                    child: Text(
                      "EDIT FAVORITES",
                      style:
                          TextStyle(fontSize: 12.0, color: GojekPalette.green),
                    ),
                  )
                ],
              ),
              Container(
                height: 300.0,
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _gojekServiceList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (context, position) {
                      return _RowGojekService(_gojekServiceList[position]);
                    }),
              )
            ],
          ),
        ),
      );
    });
  }
}

class _RowGojekService extends StatelessWidget {
  _RowGojekService(this.gojekService);
  final GojekService gojekService;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (context) {
                    return _BuildMenuBottomSheet();
                  });
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: GojekPalette.grey200, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              padding: EdgeInsets.all(12.0),
              child: Icon(
                gojekService.image,
                color: gojekService.color,
                size: 32.0,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 6.0)),
          Text(gojekService.title, style: TextStyle(fontSize: 10.0))
        ],
      ),
    );
  }
}

class _RowGoFoodFeatured extends StatelessWidget {
  _RowGoFoodFeatured(this.food);
  final Food food;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              food.image,
              width: 132.0,
              height: 132.0,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 8.0)),
          Text(food.title)
        ],
      ),
    );
  }
}

Future<List<Food>> fetchFood() async {
  _goFoodFeaturedList
      .add(Food(title: "Steak Andakar", image: "assets/images/food_1.jpg"));
  _goFoodFeaturedList
      .add(Food(title: "Mie Ayam Tumini", image: "assets/images/food_2.jpg"));
  _goFoodFeaturedList
      .add(Food(title: "Tengkleng Hohah", image: "assets/images/food_3.jpg"));
  _goFoodFeaturedList
      .add(Food(title: "Warung Steak", image: "assets/images/food_4.jpg"));
  _goFoodFeaturedList.add(
      Food(title: "Kindai Warung Banjar", image: "assets/images/food_5.jpg"));

  return Future.delayed(Duration(seconds: 1), () {
    return _goFoodFeaturedList;
  });
}

class _BerandaPageState extends State<BerandaPage> {
  @override
  void initState() {
    super.initState();

    _gojekServiceList.add(GojekService(
        image: Icons.directions_bike,
        color: GojekPalette.menuRide,
        title: "GO-RIDE"));
    _gojekServiceList.add(GojekService(
        image: Icons.local_car_wash,
        color: GojekPalette.menuCar,
        title: "GO-CAR"));
    _gojekServiceList.add(GojekService(
        image: Icons.directions_car,
        color: GojekPalette.menuBluebird,
        title: "GO-BLUEBIRD"));
    _gojekServiceList.add(GojekService(
        image: Icons.restaurant,
        color: GojekPalette.menuFood,
        title: "GO-FOOD"));
    _gojekServiceList.add(GojekService(
        image: Icons.next_week,
        color: GojekPalette.menuSend,
        title: "GO-SEND"));
    _gojekServiceList.add(GojekService(
        image: Icons.local_offer,
        color: GojekPalette.menuDeals,
        title: "GO-DEALS"));
    _gojekServiceList.add(GojekService(
        image: Icons.phonelink_ring,
        color: GojekPalette.menuPulsa,
        title: "GO-PULSA"));
    _gojekServiceList.add(GojekService(
        image: Icons.apps, color: GojekPalette.menuOther, title: "LAINNYA"));
    _gojekServiceList.add(GojekService(
        image: Icons.shopping_basket,
        color: GojekPalette.menuShop,
        title: "GO-SHOP"));
    _gojekServiceList.add(GojekService(
        image: Icons.shopping_cart,
        color: GojekPalette.menuMart,
        title: "GO-MART"));
    _gojekServiceList.add(GojekService(
        image: Icons.local_play, color: GojekPalette.menuTix, title: "GO-TIX"));

    // _goFoodFeaturedList
    //     .add(Food(title: "Steak Andakar", image: "assets/images/food_1.jpg"));
    // _goFoodFeaturedList
    //     .add(Food(title: "Mie Ayam Tumini", image: "assets/images/food_2.jpg"));
    // _goFoodFeaturedList
    //     .add(Food(title: "Tengkleng Hohah", image: "assets/images/food_3.jpg"));
    // _goFoodFeaturedList
    //     .add(Food(title: "Warung Steak", image: "assets/images/food_4.jpg"));
    // _goFoodFeaturedList.add(
    //     Food(title: "Kindai Warung Banjar", image: "assets/images/food_5.jpg"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GojekAppBar(),
        backgroundColor: GojekPalette.grey,
        body: Container(
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      _BuildGopayMenu(),
                      _BuildGojekServicesMenu()
                    ],
                  )),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 16.0),
                child: Column(
                  children: <Widget>[_BuildGoFoodFeatured()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
