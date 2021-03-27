import 'package:flutter/material.dart';
final maroon = const Color(0xFF8A1538); 

class Form {
  String formName;
  String formDetails;
  String img;
  Form({this.formName, this.formDetails, this.img});
}



class FormsList extends StatefulWidget {
  @override
  FormsListState createState() => FormsListState();
}

class FormsListState extends State<FormsList> {
  List<Widget> _formTiles = [];
  final GlobalKey _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _addForms();
  }

  void _addForms() {
    List<Form> _forms = [
      Form(
          formName: 'Form 5A',
          formDetails: 'Form given after enrollment',
          img: ''),
      Form(
          formName: 'Dropping Form',
          formDetails: 'Form for dropping a subject',
          img: ''),
    ];

    _forms.forEach((Form form) {
      _formTiles.add(_buildTile(form));
    });
  }

  Widget _buildTile(Form form) {
    return ListTile(
      dense:true,
      contentPadding: EdgeInsets.all(5),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(form.formName, style: TextStyle(fontSize: 20, color: maroon)),
          Text('${form.formDetails}',
              style: TextStyle(
                  fontSize: 12,
                  //fontWeight: FontWeight.bold,
                  color: Colors.grey[600])),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.download_sharp,
          color: Colors.grey[400],
          size: 30,
        ),
        onPressed: () {},
      ),
      leading:IconButton(
        icon: Icon(
          Icons.account_balance_sharp,
          color: Colors.grey[400],
          size: 30,
        ),
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: _listKey,
        itemCount: _formTiles.length,
        itemBuilder: (context, index) {
          return _formTiles[index];
        });
  }
}
