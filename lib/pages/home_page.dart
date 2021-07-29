import 'package:equity_soft_task/pages/add_category.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

logout() {
  googleSignIn.signOut();
  return true;
}

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  // HomePage({@required this.user});
  // final User? user;

  String? pName;
  String? pImage;
  HomePage({this.pName, this.pImage});

  var user = FirebaseAuth.instance.currentUser!;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final TextEditingController myController = TextEditingController();
  // final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    //final ref = fb.reference().child("User");

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Wardrobe',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('${widget.user.displayName}'),
                accountEmail: Text('${widget.user.email}')),
            InkWell(
              onTap: () {
                logout();
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: ListTile(
                title: Text('LogOut'),
                leading: Icon(
                  Icons.logout,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
      //backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Products(),
              SizedBox(height: 80),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddCategory()));
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Outfits",
      "image": "images/i1.PNG",
    },
    {
      "name": "Shirts",
      "image": "images/i2.PNG",
    },
    {
      "name": "Jeans",
      "image": "images/i1.PNG",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        //itemCount: productList.length ,
        itemCount: productList.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return SingleProduct(
            productName: productList[index]['name'],
            productPicture: productList[index]['image'],
          );
        },
      ),
    );
  }
}

class SingleProduct extends StatefulWidget {
  final productName;
  final productPicture;

  SingleProduct({this.productName, this.productPicture});

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 18.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.productName,
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              // GestureDetector(
              //     onTap: () {
              //       containerWidget();
              //     },
              //     child: Icon(Icons.more_vert)),
              IconButton(
                onPressed: () {
                  setState(() {
                    containerWidget();
                  });
                },
                icon: Icon(Icons.more_vert),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            color: Colors.blue,
            height: 120.0,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('${widget.productPicture}'),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(8),
                        //color: Colors.red,
                      ),
                      width: 150,
                    ),
                    //child: Image.asset('images/image1.PNG'),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class containerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: Column(
        children: [
          Text('Edit Category'),
          Text('Delete Category'),
        ],
      ),
    );
  }
}
