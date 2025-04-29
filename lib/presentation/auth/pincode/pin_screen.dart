import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrscan/helper/extensions.dart';
import 'package:qrscan/presentation/auth/bloc/auth_bloc.dart';
import 'package:qrscan/presentation/auth/bloc/auth_event.dart';
import 'package:qrscan/presentation/auth/bloc/auth_state.dart';
import 'package:qrscan/presentation/widgets/app_button.dart';
import 'package:qrscan/presentation/widgets/pin_input.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final TextEditingController _pinController = TextEditingController();
  bool _isFirstTime = true;

  @override
  void initState() {
    super.initState();
    _checkIfPinExists();
  }

  Future<void> _checkIfPinExists() async {
    final pin = await context.read<AuthBloc>().pinRepo.getPin();
    if (pin != null) {
      setState(() => _isFirstTime = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.darkestNeutrals90,
      appBar: AppBar(
          backgroundColor: context.colors.darkestNeutrals90,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _isFirstTime ? 'Definir PIN' : 'Ingresar PIN',
                style:
                    context.textStyles.heading2.copyWith(color: Colors.white),
              )
            ],
          )),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, '/qrList');
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PinInput(
                  controller: _pinController,
                  obscureText: false,
                ),
                const SizedBox(height: 50),
                AppButton(
                  title: _isFirstTime ? 'Guardar PIN' : 'Verificar PIN',
                  type: AppButtonType.secondary,
                  onTap: () {
                    if (_isFirstTime) {
                      context
                          .read<AuthBloc>()
                          .add(DefinePin(_pinController.text));
                    } else {
                      context
                          .read<AuthBloc>()
                          .add(VerifyPin(_pinController.text));
                    }
                  },
                ),
                if (state is AuthPinMismatch)
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('PIN incorrecto',
                        style: TextStyle(color: Colors.white)),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
