import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manage_my_store/mobile/ui/widgets/custom_text.dart';

class InputTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hint;
  final IconData? iconData;
  final String name;
  final List<TextInputFormatter> textInputFormatter;
  final TextInputType textInputType;
  final int maxLines;
  final TextInputAction textInputAction;
  final ValueChanged<String> onChanged;

  const InputTextField(
      {super.key,
      required this.textEditingController,
      required this.hint,
      this.iconData,
      required this.name,
      required this.textInputType,
      required this.textInputFormatter,
      this.maxLines = 1,  this.textInputAction= TextInputAction.next, required this.onChanged});

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customTextView(widget.name, 14, FontWeight.w600, Colors.black, 1),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: widget.textEditingController,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: widget.textInputType,
          inputFormatters: widget.textInputFormatter,
          textInputAction: widget.textInputAction,
          textAlign: TextAlign.start,
          autocorrect: false,
          maxLines: widget.maxLines,
          onChanged: (data){
            widget.onChanged(data);
          },
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              hintText: widget.hint,

              prefixIcon: widget.iconData!=null? Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: Icon(widget.iconData,),
              ):Icon(widget.iconData,)),
        ),
      ],
    );
  }
}
