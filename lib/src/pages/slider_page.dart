import 'package:flutter/material.dart';

class SliderPAge extends StatefulWidget {
  SliderPAge({Key? key}) : super(key: key);

  @override
  _SliderPAgeState createState() => _SliderPAgeState();
}

class _SliderPAgeState extends State<SliderPAge> {
  double _valorSlider = 100.0;
  bool _blockearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño de la imagen',
        value: _valorSlider,
        min: 50.0,
        max: 500.0,
        onChanged: (_blockearCheck)
            ? null
            : (valor) {
                setState(() {
                  _valorSlider = valor;
                });
              });
  }

  Widget _checkBox() {
    //se puede usar CheckBox pero no tiene la propiedad titulo
    return CheckboxListTile(
        title: Text('Bloquear imagen'),
        value: _blockearCheck,
        onChanged: (valor) {
          setState(() {
            _blockearCheck = (valor == null) ? false : valor;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear imagen'),
        value: _blockearCheck,
        onChanged: (valor) {
          setState(() {
            _blockearCheck = valor;
          });
        });
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://i.pinimg.com/originals/7e/4e/13/7e4e136037f8cd63909a685d814e3049.png'),
      width: _valorSlider,
    );
  }
}
