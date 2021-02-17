import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapOptionsPage extends StatefulWidget {
  @override
  _MapOptionsPageState createState() => _MapOptionsPageState();
}

class _MapOptionsPageState extends State<MapOptionsPage> {
  SharedPreferences _sharedPreferences;

  var listTileStyle = TextStyle(color: Colors.white);

  bool loading = true, itjcbu = false, bondindinho = false;

  @override
  void initState() {
    initComponents();
    super.initState();
  }

  void initComponents() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF08994D),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.popAndPushNamed(context, '/map'),
        ),
        centerTitle: true,
        title: Text(
          'Opções do Mapa',
          style: TextStyle(
            color: Color(0XFFF7B731),
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color(0XFF3867D6),
      ),
      body: Stack(
        children: [
          !loading
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Filtro de rotas',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: ListTile(
                                  title: Text(
                                    'Itajaí - Camboriú',
                                    style: listTileStyle,
                                  ),
                                  trailing: Checkbox(
                                    value: itjcbu,
                                    onChanged: (value) {
                                      _sharedPreferences.setBool(
                                          'itjcbu', value);
                                      setState(() {
                                        itjcbu = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Bondindinho',
                                  style: listTileStyle,
                                ),
                                trailing: Checkbox(
                                  value: bondindinho,
                                  onChanged: (value) {
                                    _sharedPreferences.setBool(
                                        'bondindinho', value);
                                    setState(() {
                                      bondindinho = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
