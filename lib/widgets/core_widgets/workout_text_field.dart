 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:magic/resources/app_colors.dart';
import 'package:magic/resources/styles.dart';

class WorkoutTextField extends StatefulHookConsumerWidget {
  final Function onChanged;
  final Function onCompleted;
  final String hint;
  final String? value;
  final FocusNode focusNode;
  final bool allowDecimal;
  const WorkoutTextField({Key? key, required this.onCompleted, required this.onChanged, required this.hint,this.value, required this.focusNode, required this.allowDecimal }) : super(key: key);
  @override
  ConsumerState<WorkoutTextField> createState() => _WorkoutTextFieldState();
}

class _WorkoutTextFieldState extends ConsumerState<WorkoutTextField> {
  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text:widget.value??"" );
    return Container(
        padding: const EdgeInsets.all(5),
        width: 100,
        height: 65,
        child: Center(
          child: TextField(
            inputFormatters:widget.allowDecimal?[]:[FilteringTextInputFormatter.digitsOnly],
            onTap: (){
              FocusScope.of(context).requestFocus(widget.focusNode);
            },
            focusNode: widget.focusNode,
            controller: controller,
            maxLines: 1,
            maxLength: 5,
            textAlign: TextAlign.center,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            decoration:  InputDecoration(
              hintText: widget.hint,
              hintStyle: workoutText,
              counterText: "",
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white, width: 1),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: accentColor, width: 1),
              ),
            ),
            style:
            workoutText.copyWith(color: Colors.white),
            onChanged: (String text) {
              widget.onChanged(text);
            },
            onEditingComplete: () {
              widget.onCompleted();
            },
          ),
        ));
  }
}
