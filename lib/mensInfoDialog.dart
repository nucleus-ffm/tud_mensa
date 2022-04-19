import 'package:flutter/material.dart';

class MensaInfoDialog extends StatelessWidget {
  const MensaInfoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return AlertDialog(
          title: Text('Über die Mensa: '),
          content: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(text: 'Öffnungszeiten \n \n', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextSpan(text: 'Von 11.00 - 14.15 Uhr ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' freuen wir uns auf euren Besuch! \n \n'),
                TextSpan(text: 'Aktion "Zu gut für die Tonne": \n', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'Von 14.00 - 14.15 Uhr kostet jedes Gericht die Hälfte. (So lange der Vorrat reicht.) \n \n \n'),
                TextSpan(text: 'Verkaufsstellen \n \n', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                TextSpan(text: 'Campus Stadtmitte: ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'Fenster an der Sommergrillstation "Gabel" \n'),
                TextSpan(text: 'Campus Lichtwiese: ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'Biergarten \n'),
                TextSpan(text: 'Campus Schöfferstraße: ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'Mensa \n \n'),

                TextSpan(text: 'Alle Informationen und Speisepläne ohne Gewähr von \nhttps://studierendenwerkdarmstadt.de', style: TextStyle(fontSize: 10)),

              ],
            ),
          ),
          actions: <Widget>[
            new TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('schließen'),
            )
          ],
          backgroundColor: Colors.white,
        );
  }
}


