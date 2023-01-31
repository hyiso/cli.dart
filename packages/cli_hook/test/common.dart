import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:cli_hook/cli_hook.dart';

class TestHook extends Hook {
  TestHook(this.name);

  final String name;

  bool _triggered = false;

  bool get isTriggered => _triggered;

  @override
  Future<void> run(Iterable<String> args) async {
    _triggered = true;
  }
}

class TestCommand extends Command {
  @override
  String get description => 'command for test';

  @override
  final String name;

  TestCommand(this.name);

  @override
  FutureOr? run() {}
}

class TestRunner extends CommandRunner with HookRunner {
  TestRunner(this.hooks) : super('test', 'test');

  @override
  final Map<String, Hook> hooks;
}
