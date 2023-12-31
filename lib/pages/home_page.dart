import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsigma/pages/login.dart';
import 'package:dsigma/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sticky_headers/sticky_headers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(),
                SizedBox(
                  height: 20,
                ),
                ImageCardRow(),
                StickyHeaderContent(),
                // SearchBar(),
                // SizedBox(
                //   height: 40,
                // ),
                // MiddleSection(),
                // TopCategories(),
                // FoodSection(),
                // Services(),
                // EndText()
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FAB(),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}

class StickyHeaderContent extends StatelessWidget {
  const StickyHeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return StickyHeader(
      header: const SearchBar(),
      content: const Column(
        children: [
          // SearchBar(),
          MiddleSection(),
          TopCategories(),
          FoodSection(),
          Services(),
          Work(),
          EndText(),
        ],
      ),
    );
  }
}

class Work extends StatelessWidget {
  const Work({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "How does it work?",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 20,
        ),
        const WorkRowLeft(
          path: "assets/images/homegirl1.png",
          title: "Customize Menu",
          text: "Select items for a single event or multiple events",
        ),
        const SizedBox(
          height: 20,
        ),
        const WorkRowRight(
          path: "assets/images/homegirl2.png",
          title: "Choose Services",
          text:
              "Select the type of services from varying cutlery, mode of serving options, & more",
        ),
        const SizedBox(
          height: 20,
        ),
        const WorkRowLeft(
            path: "assets/images/homepiggybank.png",
            title: "Dynamic Pricing",
            text:
                "Price per plate varies with no. of items in a plate and no. of plates selected"),
        const SizedBox(
          height: 20,
        ),
        const WorkRowRight(
          path: "assets/images/homegirl3.png",
          title: "Track Your Order",
          text:
              "Track the order status and seek help from the executives anytime",
        ),
        const SizedBox(
          height: 20,
        ),
        const WorkRowLeft(
          path: "assets/images/homegirl4.png",
          title: "Taste Your Samples",
          text:
              "Explode your taste buds with samples of what you order(on request for eligible orders)",
        ),
        const SizedBox(
          height: 20,
        ),
        const WorkRowRight(
          path: "assets/images/homecouple.png",
          title: "Enjoy Food and Services",
          text: "Enjoy event with delicious and customized foods",
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class WorkRowLeft extends StatelessWidget {
  const WorkRowLeft({
    super.key,
    required this.path,
    required this.title,
    required this.text,
  });
  final String path, title, text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          flex: 4,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [
                    Colors.amber[300]!.withOpacity(0.4),
                    Colors.amber[300]!.withOpacity(0.2),
                    Colors.amber[300]!.withOpacity(0),
                  ]),
                ),
                height: 120,
              ),
              Image(
                height: 120,
                image: AssetImage(path),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: const Color(0xFF6318AF)),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(text),
            ],
          ),
        ),
      ],
    );
  }
}

class WorkRowRight extends StatelessWidget {
  const WorkRowRight({
    super.key,
    required this.path,
    required this.title,
    required this.text,
  });
  final String path, title, text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: const Color(0xFF6318AF)),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(text),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          flex: 4,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [
                    Colors.amber[300]!.withOpacity(0.4),
                    Colors.amber[300]!.withOpacity(0.2),
                    Colors.amber[300]!.withOpacity(0),
                  ]),
                ),
                height: 120,
              ),
              Image(
                height: 120,
                image: AssetImage(path),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FAB extends StatelessWidget {
  const FAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // clipBehavior: Clip.antiAlias,
      onPressed: null,
      shape: const CircleBorder(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.amber, // You can set the border color here.
            width: 2.0, // You can set the border width here.
          ),
        ),
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        child: const Image(
          image: AssetImage("assets/icons/logo.png"),
        ),
      ),
    );
  }
}

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      height: 60,
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.deepPurple,
          ),
          Icon(
            Icons.favorite_border,
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.food_bank_outlined,
            size: 30,
          ),
          Icon(
            Icons.person_2_outlined,
            size: 30,
          ),
        ],
      ),
    );
  }
}

class EndText extends StatelessWidget {
  const EndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Text(
              "Delicious food with professional service!",
              style: Theme.of(context).textTheme.headlineMedium,
            ))
          ],
        ),
        const SizedBox(
          height: 80,
        ),
        // SizedBox(
        //   height: 200,
        //   child: Shimmer.fromColors(
        //     baseColor:
        //         Colors.grey[300]!, // Starting color of the shimmer effect
        //     highlightColor:
        //         Colors.grey[100]!, // Ending color of the shimmer effect
        //     child: Container(
        //       width: double.infinity,
        //       height: double.infinity,
        //       decoration: BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.circular(8.0),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class Services extends StatelessWidget {
  const Services({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Services",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        // const SizedBox(
        //   height: 20,
        // ),
        SizedBox(
          height: 370,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              ServicesCard(
                title: "Signature",
                points: [
                  "High Quality Disposable Cutlery",
                  "Elegant Decorations & Table Settings",
                  "Served by Waitstaff",
                  "Best for Weddings, Corporate Event...",
                ],
                recommended: true,
                image: "assets/icons/service_badge.png",
                url:
                    "https://images.pexels.com/photos/8015153/pexels-photo-8015153.jpeg",
              ),
              ServicesCard(
                title: "Value",
                points: [
                  "Disposable Cutlery",
                  "Basic Decorations & Table Settings",
                  "Served in Buffet Style",
                  "Best for Birthdays, Family...",
                ],
                recommended: false,
                image: "assets/icons/V.png",
                url:
                    "https://plusrunhkltd.com/wp-content/uploads/2022/08/Disposable-Paper-cups-e1661872815773.jpg",
              ),
              ServicesCard(
                title: "Luxury",
                points: [
                  "High End Reusable Cutlery",
                  "Elegant Decorations & Table Settings",
                  "Served by Professional Waitstaff",
                  "Best for Celebrity Parties, Political...",
                ],
                recommended: false,
                image: "assets/icons/L.png",
                url:
                    "https://d1k571r5p7i4n1.cloudfront.net/c.3630/large/Restaurants_in_Boracay.jpg",
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class ServicesCard extends StatelessWidget {
  const ServicesCard(
      {super.key,
      required this.points,
      required this.recommended,
      required this.title,
      required this.image,
      required this.url});
  final String title, image, url;
  final List<String> points;
  final bool recommended;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 350,
          width: 300,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: double.infinity,
                          color: Colors.blue[100],
                          child: CachedNetworkImage(
                            imageUrl: url,
                            fit: BoxFit.fitWidth,
                            alignment: const Alignment(0, 0.4),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image(image: AssetImage(image), height: 30),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          title,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ...points.map((e) => ServiceCardPoint(point: e)).toList(),
                  ],
                ),
              ),
              if (recommended)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Card(
                    margin: EdgeInsets.zero,
                    clipBehavior: Clip.antiAlias,
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Container(
                      color: Colors.blue,
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Recommended",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceCardPoint extends StatelessWidget {
  const ServiceCardPoint({
    super.key,
    required this.point,
  });
  final String point;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          image: AssetImage("assets/icons/service_bullet.png"),
          height: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(child: Text(point)),
      ],
    );
  }
}

class TopCategories extends StatelessWidget {
  const TopCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Top Categories",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CategoryItem(
                name: "Burger",
                path: "assets/images/burg.png",
              ),
              CategoryItem(
                name: "Desserts",
                path: "assets/images/cake.png",
              ),
              CategoryItem(
                name: "Pizza",
                path: "assets/images/pizza.png",
              ),
              CategoryItem(
                name: "Salad",
                path: "assets/images/noodles.png",
              ),
              CategoryItem(
                name: "Chicken",
                path: "assets/images/chicken.png",
              ),
              CategoryItem(
                name: "Rice",
                path: "assets/images/biryani.png",
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.name,
    required this.path,
  });
  final String path, name;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage(path),
            ),
          ),
          Text(name),
        ],
      ),
    );
  }
}

class FoodSection extends StatelessWidget {
  const FoodSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Starters",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              FoodCard(
                  name: "Grill Chicken",
                  url:
                      "https://images.saymedia-content.com/.image/c_limit%2Ccs_srgb%2Cq_auto:eco%2Cw_760/MTk2OTUxMTk0MTkzNjM1MDc3/kebabs.webp"),
              FoodCard(
                  name: "Mushroom Fry",
                  url:
                      "https://1.bp.blogspot.com/-6wJmi-l0ido/WMlamwCpJTI/AAAAAAAABAQ/vg4pt5V-4jI5jBhkxzljR_rxnCnn6c_pACLcB/s1600/Tangsuyuk1.jpg"),
              FoodCard(
                  name: "Veggies Fry",
                  url:
                      "https://img.republicworld.com/republic-prod/stories/promolarge/xhdpi/r2bqbrhzo0oxzcwx_1585326735.jpeg"),
              FoodCard(
                  name: "Grill Chicken",
                  url:
                      "https://images.saymedia-content.com/.image/c_limit%2Ccs_srgb%2Cq_auto:eco%2Cw_760/MTk2OTUxMTk0MTkzNjM1MDc3/kebabs.webp"),
              FoodCard(
                  name: "Grill Chicken",
                  url:
                      "https://images.saymedia-content.com/.image/c_limit%2Ccs_srgb%2Cq_auto:eco%2Cw_760/MTk2OTUxMTk0MTkzNjM1MDc3/kebabs.webp"),
              FoodCard(
                  name: "Grill Chicken",
                  url:
                      "https://images.saymedia-content.com/.image/c_limit%2Ccs_srgb%2Cq_auto:eco%2Cw_760/MTk2OTUxMTk0MTkzNjM1MDc3/kebabs.webp"),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Main Course",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              FoodCard(
                  name: "Biryani",
                  url:
                      "https://res.cloudinary.com/simplotel/image/upload/w_5000,h_3067/x_0,y_133,w_5000,h_2811,r_0,c_crop,q_80,fl_progressive/w_1237,f_auto,c_fit/clarks-inn-express-sirkazhi/mario-raj-n1z3gc9gJ8I-unsplash_xc01sl"),
              FoodCard(
                  name: "Bread",
                  url:
                      "https://www.amazinghomemadepizza.com/wp-content/uploads/2020/10/frozen-dough-750x500.jpg"),
              FoodCard(
                  name: "Plain Rice",
                  url:
                      "https://www.archanaskitchen.com/images/archanaskitchen/0-Archanas-Kitchen-Recipes/2018/June-07/Dhaba_Style_Ghee_Rice_Recipe-1.jpg"),
              FoodCard(
                  name: "Grill Chicken",
                  url:
                      "https://images.saymedia-content.com/.image/c_limit%2Ccs_srgb%2Cq_auto:eco%2Cw_760/MTk2OTUxMTk0MTkzNjM1MDc3/kebabs.webp"),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.name,
    required this.url,
  });
  final String name, url;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        // borderRadius: BorderRadius.circular(25),
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        child: SizedBox(
          // color: Colors.blue[100],
          height: 130,
          width: 150,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.blue[300],
                  child: CachedNetworkImage(
                    imageUrl: url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MiddleSection extends StatelessWidget {
  const MiddleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Start crafting",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 180,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: const [
              CraftingCard(
                title: "Default Platters",
                url:
                    "https://static-blog.treebo.com/wp-content/uploads/2023/03/Mandap-1024x675.jpg",
              ),
              CraftingCard(
                title: "Craft Your Own",
                url:
                    "https://cdn.thealternativedaily.com/wp-content/uploads/2015/09/Fotolia_89927007_Subscription_Monthly_M.jpg",
              ),
              CraftingCard(
                title: "Default Platters",
                url:
                    "https://static-blog.treebo.com/wp-content/uploads/2023/03/Mandap-1024x675.jpg",
              ),
              CraftingCard(
                title: "Craft Your Own",
                url:
                    "https://cdn.thealternativedaily.com/wp-content/uploads/2015/09/Fotolia_89927007_Subscription_Monthly_M.jpg",
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              AnotherCraftingCard(),
              SizedBox(
                width: 15,
              ),
              AnotherCraftingCard(),
              SizedBox(
                width: 15,
              ),
              AnotherCraftingCard(),
              SizedBox(
                width: 15,
              ),
              AnotherCraftingCard(),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class AnotherCraftingCard extends StatelessWidget {
  const AnotherCraftingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          height: 185,
          width: 215,
        ),
        Positioned(
          left: 20,
          right: 1,
          bottom: 5,
          top: 1,
          child: Card(
            // borderRadius: BorderRadius.circular(15),
            clipBehavior: Clip.antiAlias,
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(8),
              // color: Colors.blue[100],
              height: 180,
              width: 190,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Default Menu"),
                  Expanded(
                      child: Row(
                    children: [
                      Flexible(flex: 14, child: Container()),
                      Flexible(
                          flex: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "3 starters",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                "3 maincourse",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                "3 desserts",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                "3 drinks",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          )),
                    ],
                  )),
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 15,
                      ),
                      Text(
                        "Min 800",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Text(
                    "Starts at \$777",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: const Color(0xFF6318AF),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 30,
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(45),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: const Image(
                image: AssetImage("assets/images/circular_food2.png"),
                height: 90,
                width: 90,
                fit: BoxFit.fill,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CraftingCard extends StatelessWidget {
  const CraftingCard({super.key, required this.title, required this.url});
  final String title, url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(left: 15),
        child: Card(
          color: Colors.white,
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          child: SizedBox(
            height: 150,
            width: 170,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.blue[300],
                    child: CachedNetworkImage(
                      imageUrl: url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              suffixIcon: Icon(
                Icons.search,
                color: Color(0xFF6318AF),
              ),
              hintText: 'Search food or events',
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}

class ImageCardRow extends StatelessWidget {
  const ImageCardRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          ImageCard(
            url: "https://i.ibb.co/6b6y2Lc/2.png",
          ),
          SizedBox(
            width: 20,
          ),
          ImageCard(
              url:
                  "https://miamiuniversitysand.weebly.com/uploads/2/5/4/2/25426545/1.png"),
        ],
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        height: 150,
        width: 300,
        // color: Colors.blue[100],
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          placeholder: (context, url) {
            return Shimmer.fromColors(
              baseColor:
                  Colors.grey[300]!, // Starting color of the shimmer effect
              highlightColor:
                  Colors.grey[100]!, // Ending color of the shimmer effect
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Monica!",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: const Color(0xFF6318AF)),
            ),
            const Spacer(),
            TextButton(
              onPressed: () async {
                try {
                  await Auth().signOut();
                  if (!context.mounted) return;
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                      (route) => false);
                } on FirebaseAuthException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.message ?? ""),
                      duration: const Duration(
                          seconds: 8), // Adjust the duration as needed
                    ),
                  );
                }
              },
              child: const Text("Log Out"),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Current location"),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Color(0xFF6318AF),
                    ),
                    Text("Hyderabad"),
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Icon(
                  Icons.play_circle_outline,
                  color: Color(0xFF6318AF),
                ),
                Text("How it works?")
              ],
            )
          ],
        )
      ],
    );
  }
}
