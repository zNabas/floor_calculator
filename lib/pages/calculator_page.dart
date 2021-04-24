import '../controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/number_input_field.dart';
import '../widgets/primary_button.dart';
import 'result_dialog.dart';
import '../widgets/text_header.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = CalculatorController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      padding: EdgeInsets.all(kSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextHeader(label: kEnvironmentHeader, opacity: kOpacityHeader),
          SizedBox(height: kSpace),
          NumberInputField(
            label: '$kWidth ($kMeters)',
            onSaved: _controller.setRoomWidth,
          ),
          SizedBox(height: kSpace),
          NumberInputField(
            label: '$kLength ($kMeters)',
            onSaved: _controller.setRoomLength,
          ),
          SizedBox(height: kBigSpace),
          TextHeader(label: kFloorHeader, opacity: kOpacityHeader),
          SizedBox(height: kSpace),
          NumberInputField(
            label: '$kWidth ($kMeters)',
            onSaved: _controller.setFloorWidth,
          ),
          SizedBox(height: kSpace),
          NumberInputField(
            label: '$kLength ($kMeters)',
            onSaved: _controller.setFloorLength,
          ),
          SizedBox(height: kSpace),
          NumberInputField(
            label: 'Preço por Metro',
            onSaved: _controller.precoSalvar,
          ),
          SizedBox(height: kBigSpace),
          PrimaryButton(
            label: kCalculateButton,
            onPressed: _onCalculate,
          ),
          SizedBox(height: kSmallSpace),
          PrimaryButton(
            label: 'Limpar Dados',
            onPressed: limparCampos,
          ),
        ],
      ),
    );
  }

  void limparCampos() {
    _formKey.currentState.reset();
  }

  void _onCalculate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final result = _controller.calculate();
      ResultDialog.show(context, result);
    }
  }
}
