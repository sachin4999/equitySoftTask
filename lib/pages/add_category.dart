import 'package:equity_soft_task/constants/constants_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddCategory extends StatefulWidget {
  String? categoryName = "";
  String? categoryImage = "";

  AddCategory({this.categoryName, this.categoryImage});

  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final TextEditingController myController = TextEditingController();
  final TextEditingController myControllerTwo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Add category name',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: TextFormField(
              controller: myController,
            ),
          ),
          Text(
            'Add category Image',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: TextFormField(
              controller: myControllerTwo,
            ),
          ),
          //TextFormField(controller: myController,),
          ElevatedButton(
            onPressed: () {
              setState(() {
                categoryName = myController.text.toString();
                categoryImage = myControllerTwo.text.toString();
              });
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => HomePage(
              //               pName: categoryName,
              //               pImage: categoryImage,
              //             )));
            },
            child: Text('Submit'),
          ),
          SizedBox(height: 50),
          Text(categoryName.toString()),
          Image.asset(
            categoryImage.toString(),
            height: 80,
            width: 80,
          ),
        ],
      ),
    );
  }
}
