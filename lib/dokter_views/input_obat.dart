import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/widgets.dart';
import 'package:rekam_medis_redis/datafake/obat.dart';

class InputObat extends StatefulWidget {
  const InputObat({super.key});
  

  @override
  _InputObatState createState() => _InputObatState();
}

class _InputObatState extends State<InputObat> {
  String? _selectedObat;
  String? _selectedType;
  String? _selectedTypeOf;
  int _kuantitasObat = 1;
  int _kuantitasWaktu = 1;
  int _kuantitasTipe = 1;
  int? _selectedWaktu;
  String? _catatan;

   final TextEditingController _obatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Resep Obat"),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
               children: [
                  const Expanded(
                    child: Text(
                      "Nama Obat",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                     
                    },
                    child: Image.asset(
                      'assets/Dropdown.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
              
              Row(
                children: [
                  Expanded(
                    child: AutoCompleteTextField<String>(
                      key: GlobalKey<AutoCompleteTextFieldState<String>>(),
                      clearOnSubmit: false,
                      suggestions: obat.map((Map<String, String> value) {
                        return value['name']!;
                      }).toList(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF38608F)),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                       
                      ),
                      itemFilter: (item, query) {
                        return item.toLowerCase().startsWith(query.toLowerCase());
                      },
                      itemSorter: (a, b) {
                        return a.compareTo(b);
                      },
                      itemSubmitted: (item) {
                        setState(() {
                          _selectedObat = item;
                          _obatController.text = item; 
                        });
                      },
                      
                      itemBuilder: (context, item) {
                        return ListTile(
                          title: Text(item),
                        );
                      }, 
                    
                    ),
                    
                  ),
                  
                ],
              ),
              
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 3.0, left: 4.0),
                child: Text("Kuantitas"),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_kuantitasObat > 1) {
                          _kuantitasObat--;
                        }
                      });
                    },
                    child: Image.asset('assets/minus.png'),
                  ),
                  Expanded(
                    child: Text(
                      _kuantitasObat.toString(),
                      textAlign: TextAlign.center, 
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _kuantitasObat++;
                      });
                    },
                    child: Image.asset('assets/plus (2).png'),
                  ),
                  Expanded(
                    flex: 3,
                    child: PopupMenuButton<String>(
                      initialValue: _selectedType,
                      onSelected: (String? value) {
                        setState(() {
                          _selectedType = value;
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return obat.map((Map<String, String> value) {
                          return PopupMenuItem<String>(
                            value: value['tipe'],
                            child: Text(value['tipe']!),
                          );
                        }).toList();
                      },
                      child: ListTile(
                        title: Text(_selectedType ?? ' '),
                        trailing: Image.asset("assets/Dropdown.png"),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 4.0),
                child: Text(
                  "Cara Penggunaan",
                ),
              ),
              
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_kuantitasTipe > 1) {
                          _kuantitasTipe--;
                        }
                      });
                    },
                    child: Image.asset('assets/minus.png'),
                  ),
                  Expanded(
                    child: Text(
                      _kuantitasTipe.toString(),
                      textAlign: TextAlign.center, 
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _kuantitasTipe++;
                      });
                    },
                    child: Image.asset('assets/plus (2).png'),
                  ),
                 const Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child:  Text("Per Hari"),
                      ),
                  ),
        
                ],
              ),
                Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_kuantitasWaktu > 1) {
                          _kuantitasWaktu--;
                        }
                      });
                    },
                    child: Image.asset('assets/minus.png'),
                  ),
                  Expanded(
                    child: Text(
                      _kuantitasWaktu.toString(),
                      textAlign: TextAlign.center, 
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _kuantitasWaktu++;
                      });
                    },
                    child: Image.asset('assets/plus (2).png'),
                  ),
                  Expanded(
                    flex: 3,
                    child: PopupMenuButton<String>(
                      initialValue: _selectedTypeOf,
                      onSelected: (String? value) {
                        setState(() {
                          _selectedTypeOf = value;
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return obat.map((Map<String, String> value) {
                          return PopupMenuItem<String>(
                            value: value['penggunaan'],
                            child: Text(value['penggunaan']!),
                          );
                        }).toList();
                      },
                      child: ListTile(
                        title: Text(_selectedTypeOf ?? ' '),
                        trailing: Image.asset("assets/Dropdown.png"),
                      ),
                    ),
                  ),
                ],
              ),
               const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 4.0),
                child: Text(
                  "Waktu Penggunaan",
                ),
              ),
        
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: _selectedWaktu,
                    onChanged: (value) {
                      setState(() {
                        _selectedWaktu = value;
                      });
                    },
                    activeColor: Color(0xFF38608F), 
                  ),
                  Text("Sebelum Makan"),
                  Radio(
                    value: 2,
                    groupValue: _selectedWaktu,
                    onChanged: (value) {
                      setState(() {
                        _selectedWaktu = value;
                      });
                    },
                    activeColor: Color(0xFF38608F), 
                  ),
                  Text("Saat Makan"),
                ],
              ),
        
              Row(
                children: [
                  Radio(
                    value: 3,
                    groupValue: _selectedWaktu,
                    onChanged: (value) {
                      setState(() {
                        _selectedWaktu = value;
                      });
                      
                    },
                    activeColor: Color(0xFF38608F), 
                  ),
                  Text("Sesudah Makan"),
                  Radio(
                    value: 4,
                    groupValue: _selectedWaktu,
                    onChanged: (value) {
                      setState(() {
                        _selectedWaktu = value;
                      });
                    },
                    activeColor: Color(0xFF38608F), 
                  ),
                  Text("Sebelum Tidur"),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 4.0),
                child: Text(
                  "Catatan",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF38608F)),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _catatan = value;
                    });
                  },
                ),
                
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    
                  },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xff5195D6), width: 1),
                      
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Tambah Obat",
                  style: TextStyle(
                    color: 
                    Color(0xff5195D6),
                  ),),
                ),
                          ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff5195D6),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xff5195D6), width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Simpan",
                  style: TextStyle(
                    color: 
                    Colors.white,
                  ),),
                ),
              ),
            ],
            
          ),
          
        ),
      ),
      
      
    );
  }
}
