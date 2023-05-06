import 'package:bimatarung_design_system/bimatarung_design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackbarPage extends StatelessWidget {
  SnackbarPage({super.key});

  final ValueNotifier<bool> _isShown = ValueNotifier(false);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Bimatarung Snackbar'),
        ),
        persistentFooterButtons: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20.w - 8.w,
              vertical: 10.w,
            ),
            color: Colors.transparent,
            child: BTButton(
              label: 'Show Snackbar',
              onPressed: () async {
                _isShown.value = true;
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      content: BTSnackbar(
                        state: BTSnackbarState.failed,
                        message: 'This is snackbar',
                        actionText: 'Hide',
                        actionCallback: () {
                          _isShown.value = false;
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ),
                  );
              },
            ),
          ),
        ],
        body: Stack(
          children: [
            ListView(
              padding: EdgeInsets.symmetric(vertical: 20.w),
              children: const [
                _Child(
                  state: BTSnackbarState.success,
                ),
                _Child(
                  state: BTSnackbarState.failed,
                ),
                _Child(
                  state: BTSnackbarState.warning,
                ),
                _Child(
                  state: BTSnackbarState.normal,
                ),
              ],
            ),
            ValueListenableBuilder(
              valueListenable: _isShown,
              child: Container(
                color: BTColors.neutral90.withOpacity(0.7),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Snackbar is shown below!',
                      style: BTTextStyle.heading(),
                    ),
                    8.verticalSpace,
                    Text(
                      'Tap to hide overlay!',
                      style: BTTextStyle.bodySmall(),
                    ),
                  ],
                ),
              ),
              builder: (context, isShown, child) => AnimatedOpacity(
                opacity: isShown ? 1 : 0,
                duration: const Duration(
                  milliseconds: 400,
                ),
                child: IgnorePointer(
                  ignoring: !isShown,
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      _isShown.value = false;
                    },
                    child: child,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class _Child extends StatelessWidget {
  const _Child({required this.state});

  final BTSnackbarState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'State: ${state.name}',
            style: BTTextStyle.heading(),
          ),
        ),
        16.verticalSpace,
        Column(
          children: [
            _TooltopChild(
              '❌ Action ❌ Leading',
              BTSnackbar(
                state: state,
                message: 'Message',
              ),
            ),
            _TooltopChild(
              '✅ Action ❌ Leading',
              BTSnackbar(
                state: state,
                message: 'Message',
                actionText: 'Action',
                actionCallback: () => _callback(context),
              ),
            ),
            _TooltopChild(
              '❌ Action ✅ Leading',
              BTSnackbar(
                state: state,
                message: 'Message',
                leading: Icon(
                  Icons.warning_amber_rounded,
                  color: state.style.actionColor,
                ),
              ),
            ),
            _TooltopChild(
              '✅ Action ✅ Leading',
              BTSnackbar(
                state: state,
                message: 'Message',
                actionText: 'Action',
                actionCallback: () => _callback(context),
                leading: Icon(
                  CupertinoIcons.checkmark,
                  color: state.style.textColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _callback(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          elevation: 0,
          content: BTSnackbar(
            state: state,
            message: 'Clicked',
          ),
        ),
      );
  }
}

class _TooltopChild extends StatelessWidget {
  const _TooltopChild(this.message, this.snackbar);

  final String message;
  final BTSnackbar snackbar;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      triggerMode: TooltipTriggerMode.tap,
      child: snackbar,
    );
  }
}
