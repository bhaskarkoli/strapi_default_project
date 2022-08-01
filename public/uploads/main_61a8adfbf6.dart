import 'dart:convert';
import 'dart:io';

import 'package:example/src/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

import 'src/theme_page.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {

  const RootPage({
    Key? key,
  }) : super(key: key);

  static const _themes = [
    'default',
    'big_red',
    'calm_blue',
  ];

  Future<void> _onThemeSelected(BuildContext context, String themeId) async {
    var themeStr = await rootBundle.loadString('assets/themes/$themeId.json');
    var themeJson = json.decode(themeStr);

    var theme = ThemeDecoder.decodeThemeData(themeJson) ?? ThemeData();

    themeToJsonTest();

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => ThemePage(
          theme: theme,
        ),
      ),
    );
  }

  void themeToJsonTest() async {
    try {
    String? themeJson = jsonEncode(ThemeEncoder.encodeThemeData(Themes.cactus.dark));
    if (themeJson != null && themeJson.trim().isNotEmpty) {
        List<Directory>? directories = await getExternalCacheDirectories();
        Directory? directory = directories != null && directories.isNotEmpty
                  ? directories.first
                  : null;
        if (directory != null) {
                File file = File('${directory.path}/theme.json');
                await file.writeAsString(themeJson);
                print("Theme Json Created Successfully");
              }
      }
    } catch (e) {
        print(e);
        print("Failed to Create Theme Json");
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Theme'),
      ),
      body: ListView.builder(
        itemCount: _themes.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(_themes[index]),
          onTap: () => _onThemeSelected(context, _themes[index]),
        ),
      ),
    );
  }
}
