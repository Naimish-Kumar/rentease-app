import 'package:rentease/app/register_cubits.dart';
import 'package:rentease/exports/main_export.dart';
import 'package:rentease/ui/screens/chat/chat_audio/globals.dart';
import 'package:rentease/ui/screens/chat_new/message_types/registerar.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
}

class EntryPoint extends StatefulWidget {
  const EntryPoint({
    super.key,
  });
  @override
  EntryPointState createState() => EntryPointState();
}

class EntryPointState extends State<EntryPoint> {
  @override
  void initState() {
    super.initState();
    ChatMessageHandler.handle();
    ChatGlobals.init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ...RegisterCubits().register(),
      ],
      child: Builder(
        builder: (BuildContext context) {
          return const App();
        },
      ),
    );
  }
}
