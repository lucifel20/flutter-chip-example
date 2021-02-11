import 'package:flutter/material.dart';

void main() => runApp(ChipExample());

class ChipExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    const String APP_TITLE = 'Flutter Chip Example';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      home: HomeRoute(),
    ); // MaterialApp()
  }
}

class HomeRoute extends StatefulWidget {
  @override
  _HomeRoute createState() => _HomeRoute();
}

class _HomeRoute extends State<HomeRoute> {
  //
  String _chipDLabel = 'Download';
  bool _isChipDPressed = false;

  void _chipDPressed() {
    _isChipDPressed = !_isChipDPressed;
    setState(() {
      _chipDLabel = _isChipDPressed ? 'Downloading...' : 'Download';
    });
  }

  String _text = '';
  bool _isEnglishSelected = false;
  bool _isFrenchSelected = false;
  bool _isJapaneseSelected = false;

  void _displaySelected() {
    setState(() {
      _text = _isEnglishSelected ? 'English ' : '';
      _text += _isFrenchSelected ? 'French ' : '';
      _text += _isJapaneseSelected ? 'Japanese ' : '';
    });
  }

  void _englishChipSelected(bool isSelected) {
    _isEnglishSelected = isSelected;
    _displaySelected();
  }

  void _frenchChipSelected(bool isSelected) {
    _isFrenchSelected = isSelected;
    _displaySelected();
  }

  void _japaneseChipSelected(bool isSelected) {
    _isJapaneseSelected = isSelected;
    _displaySelected();
  }

  int _selectedIdx = 0;

  void _programmingLangSelected(int idx) {
    setState(() {
      _selectedIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Wrap(
              spacing: 6.0,
              runSpacing: 6.0,
              children: <Widget>[
                Chip(
                  label: Text(
                    'Apple',
                    style: TextStyle(color: Colors.white),
                  ), // Text()
                  elevation: 10.0,
                  backgroundColor: Colors.pink,
                  shadowColor: Colors.indigo,
                  avatar: CircleAvatar(
                    child: Text('A'),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ), // CircleAvatar()
                ), // Chip()
                Chip(
                  label: Text(
                    'Boy',
                    style: TextStyle(color: Colors.white),
                  ), // Text()
                  elevation: 10.0,
                  backgroundColor: Colors.lightBlue,
                  shadowColor: Colors.indigo,
                  avatar: CircleAvatar(
                    child: Text('B'),
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                  ), // CircleAvatar()
                ), // Chip()
                Chip(
                  label: Text(
                    'Cat',
                    style: TextStyle(color: Colors.white),
                  ), // Text()
                  elevation: 10.0,
                  backgroundColor: Colors.orange,
                  shadowColor: Colors.indigo,
                  avatar: CircleAvatar(
                    child: Text('C'),
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                  ), // CircleAvatar()
                ), // Chip()
              ], // List<Widget>[]
            ), // Wrap()
            SizedBox(
              height: 30.0,
            ), // SizedBox()
            ActionChip(
              label: Text(
                _chipDLabel,
                style: TextStyle(color: Colors.white),
              ), // Text()
              elevation: 10.0,
              pressElevation: 20.0,
              backgroundColor: Colors.blueGrey,
              shadowColor: Colors.indigo,
              avatar: _isChipDPressed
                  ? CircularProgressIndicator()
                  : CircleAvatar(
                      child: Text('D'),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ), // CircleAvatar()
              onPressed: _chipDPressed,
            ), // ActionChip()
            SizedBox(
              height: 30.0,
            ), // SizedBox()
            Wrap(
              spacing: 6.0,
              runSpacing: 6.0,
              children: <Widget>[
                FilterChip(
                  label: Text(
                    'English',
                    style: TextStyle(color: Colors.indigo),
                  ), // Text()
                  elevation: 10.0,
                  pressElevation: 20.0,
                  selected: _isEnglishSelected,
                  selectedColor: Colors.blueAccent,
                  selectedShadowColor: Colors.indigo,
                  checkmarkColor: Colors.yellowAccent,
                  avatar: CircleAvatar(
                    child: Text('E'),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ), // CircleAvatar()
                  onSelected: _englishChipSelected,
                ), // FilterChip()
                FilterChip(
                  label: Text(
                    'French',
                    style: TextStyle(color: Colors.indigo),
                  ), // Text()
                  elevation: 10.0,
                  pressElevation: 20.0,
                  selected: _isFrenchSelected,
                  selectedColor: Colors.blueAccent,
                  selectedShadowColor: Colors.indigo,
                  checkmarkColor: Colors.yellowAccent,
                  avatar: CircleAvatar(
                    child: Text('F'),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ), // CircleAvatar()
                  onSelected: _frenchChipSelected,
                ), // FilterChip()
                FilterChip(
                  label: Text(
                    'Japanese',
                    style: TextStyle(color: Colors.indigo),
                  ), // Text()
                  elevation: 10.0,
                  pressElevation: 20.0,
                  selected: _isJapaneseSelected,
                  selectedColor: Colors.blueAccent,
                  selectedShadowColor: Colors.indigo,
                  checkmarkColor: Colors.yellowAccent,
                  avatar: CircleAvatar(
                    child: Text('J'),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ), // CircleAvatar()
                  onSelected: _japaneseChipSelected,
                ), // FilterChip()
              ], // List<Widget>[]
            ), // Wrap()
            Text(_text),
            SizedBox(
              height: 30.0,
            ), // SizedBox()
            Wrap(
              spacing: 6.0,
              runSpacing: 6.0,
              children: <Widget>[
                ChoiceChip(
                  label: Text(
                    'Kotlin',
                    style: TextStyle(
                      color: _selectedIdx == 0
                          ? Colors.yellowAccent
                          : Colors.indigo,
                    ), // TextStyle()
                  ), // Text()
                  elevation: 10.0,
                  pressElevation: 20.0,
                  selected: _selectedIdx == 0,
                  selectedColor: Colors.black,
                  selectedShadowColor: Colors.indigo,
                  avatar: CircleAvatar(
                    child: Text('K'),
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                  ), // CircleAvatar()
                  onSelected: (bool) {
                    _programmingLangSelected(0);
                  },
                ), // ChoiceChip()
                ChoiceChip(
                  label: Text(
                    'Python',
                    style: TextStyle(
                      color: _selectedIdx == 1
                          ? Colors.yellowAccent
                          : Colors.indigo,
                    ), // TextStyle()
                  ), // Text()
                  elevation: 10.0,
                  pressElevation: 20.0,
                  selected: _selectedIdx == 1,
                  selectedColor: Colors.black,
                  selectedShadowColor: Colors.indigo,
                  avatar: CircleAvatar(
                    child: Text('P'),
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                  ), // CircleAvatar()
                  onSelected: (bool) {
                    _programmingLangSelected(1);
                  },
                ), // ChoiceChip()
                ChoiceChip(
                  label: Text(
                    'Swift',
                    style: TextStyle(
                      color: _selectedIdx == 2
                          ? Colors.yellowAccent
                          : Colors.indigo,
                    ), // TextStyle()
                  ), // Text()
                  elevation: 10.0,
                  pressElevation: 20.0,
                  selected: _selectedIdx == 2,
                  selectedColor: Colors.black,
                  selectedShadowColor: Colors.indigo,
                  avatar: CircleAvatar(
                    child: Text('S'),
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                  ), // CircleAvatar()
                  onSelected: (bool) {
                    _programmingLangSelected(2);
                  },
                ), // ChoiceChip()
              ], // List<Widget>[]
            ), // Wrap()
          ], // List<Widget>[]
        ), // Column()
      ), // SafeArea()
    ); // Scaffold()
  }
}
