import 'package:curd_rest_api/Style/Style.dart';
import 'package:flutter/material.dart';

class ProductCreateScreen extends StatefulWidget {
  @override
  State<ProductCreateScreen> createState() => _ProductcreatescreenState();
}

class _ProductcreatescreenState extends State<ProductCreateScreen> {
  Map<String, String> FromValues = {
    "ProductName": " ",
    "ProductCode": " ",
    "Img": " ",
    "Qty": " ",
    "UnitPrice": " ",
    "TotalPrice": " "
  };

  // to using 6 input field we used 6 time call a{OnPressed} function which can be Expensive. instead of this we will use InputOnChange()
  InputOnChange(Mapkey, TextValue) {
    setState(() {
      FromValues.update(Mapkey, (value) => TextValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Set app bar color to blue
        centerTitle: true, // Center the title
        title: const Text(
          "Create Product",
          style: TextStyle(
            color: Colors.black, // Set text color to black
            fontWeight: FontWeight.bold, // Set text to bold
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black), // Drawer icon
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open drawer when pressed
            },
          ),
        ),
      ),

      // drawer calss
      drawer: Drawer(),
      body: Stack(
        children: [
          // Background Graphics
          ScreenBackground(context),
          Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: AppInputDecoration('Product Name:'),
                    onChanged: (Textvalue) {
                      InputOnChange("ProductName", Textvalue);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: AppInputDecoration('Product Code:'),
                    onChanged: (Textvalue) {
                      InputOnChange("ProductCode", Textvalue);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: AppInputDecoration('Product Image:'),
                    onChanged: (Textvalue) {
                      InputOnChange("Img", Textvalue);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: AppInputDecoration('Product Unit Price:'),
                    onChanged: (Textvalue) {
                      InputOnChange("UnitPrice", Textvalue);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: AppInputDecoration('Product Total Price:'),
                    onChanged: (Textvalue) {
                      InputOnChange("TotalPrice", Textvalue);
                    },
                  ),
                  const SizedBox(height: 20),

                  // dROPdOWN
                  AppDropDownStyle(DropdownButton(
                    value: FromValues['Qty'],
                    items: const [
                      DropdownMenuItem(
                        value: " ",
                        child: Text('Select Qt'),
                      ),
                      DropdownMenuItem(
                        value: "1PC",
                        child: Text('1Pc'),
                      ),
                      DropdownMenuItem(
                        value: "2pc",
                        child: Text('2pc'),
                      ),
                      DropdownMenuItem(
                        value: "3pc",
                        child: Text('3pc'),
                      ),
                      DropdownMenuItem(
                        value: "4pc",
                        child: Text('4pc'),
                      ),
                    ],
                    onChanged: (Textvalue) {
                      InputOnChange("Qty", Textvalue);
                    },
                    underline: Container(),
                    isExpanded: true,
                  )),
                  const SizedBox(height: 20),
                  Container(
                      child: ElevatedButton(
                          style: AppButtonStyle(),
                          onPressed: () {},
                          child: SucessButtonChild('Submit')))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
