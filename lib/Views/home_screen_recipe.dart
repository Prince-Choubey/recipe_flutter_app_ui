import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipe_flutter_app_ui/Colors/colors.dart';
import 'package:recipe_flutter_app_ui/Models/recipe_model.dart';

class HomeScreenRecipe extends StatefulWidget {
  const HomeScreenRecipe({super.key});

  @override
  State<HomeScreenRecipe> createState() => _HomeScreenRecipeState();
}

class _HomeScreenRecipeState extends State<HomeScreenRecipe> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: recipeAppBackground,
      body: SafeArea(
        child: Column(
          children: [
            headerParts(),
            SizedBox(height: 30),
            mySearchField(),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular menus",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            popularMenuItems(),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView popularMenuItems() {
    return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                menuItems.length,
                (index) => Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {});
                      selectedIndex = index;
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            selectedIndex == index
                                ? Colors.green
                                : Colors.white,
                            selectedIndex == index
                                ? Colors.greenAccent
                                : Colors.white,
                          ],
                        ),
                      ),
                      child: Text(
                        menuItems[index],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight:
                              selectedIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                          color:
                              selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Padding mySearchField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: searchBarColor,
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Iconsax.search_normal, color: Colors.black45),
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.black26),
            contentPadding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }

  Padding headerParts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Hello Peter,\n",
                  style: TextStyle(fontSize: 16),
                ),
                TextSpan(
                  text: "What do you want to eat today?",
                  style: TextStyle(fontSize: 13, color: Colors.black45),
                ),
              ],
            ),
          ),
          Spacer(),
          Stack(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  "https://tse2.mm.bing.net/th/id/OIP.NWf2PzgA833ETeILN9qnmgHaE7?pid=Api&P=0&h=180",
                ),
              ),
              Positioned(
                top: 1,
                right: 1,
                child: Container(
                  height: 9,
                  width: 9,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
