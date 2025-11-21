import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:tudu/config/styles.dart';
import 'package:tudu/features/family/data/models/id_model.dart';

class AddParticipantDialog extends StatefulWidget {
  const AddParticipantDialog({super.key});

  @override
  State<AddParticipantDialog> createState() => _AddParticipantDialogState();
}

class _AddParticipantDialogState extends State<AddParticipantDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  bool _buttonReady = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged(String value) {
    setState(() {
      _buttonReady = value.length >= 10;
    });
  }

  Future<void> _onSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      final searchUser = SearchUserWithId(
        searchUserData: SearchUserData(id: _controller.text),
        talker: GetIt.I<Talker>(),
      );

      await searchUser.search();

      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: 354.w,
        height: 200.h,
        decoration: BoxDecoration(
          color: const Color(0xFFFFEDD5),
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: const Color(0xFFEF8249), width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 14.h),
            Container(
              width: 318.w,
              height: 60.h,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r), color: const Color(0xFFEF8249)),
              child: Center(
                child: Text(
                  "Введите айди нового\nучастника",
                  textAlign: TextAlign.center,
                  style: AppStyles.taskText.copyWith(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Form(
              key: _formKey,
              child: SizedBox(
                width: 318.w,
                height: 50.h,
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Ввести',
                    hintStyle: AppStyles.authText.copyWith(color: Colors.white, fontSize: 17.sp),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: Color(0xFFFF0000), width: 1.w),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: Color(0xFFFF0000), width: 1.w),
                    ),

                    counterText: '',

                    errorStyle: TextStyle(height: 0, fontSize: 0),
                    filled: true,
                    fillColor: const Color(0xFFEF8249).withValues(alpha: 0.5),
                  ),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  style: AppStyles.authText.copyWith(color: Colors.white, fontSize: 17.sp),
                  cursorColor: Colors.white,
                  textAlign: TextAlign.left,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Айди не может быть пустым';
                    } else if (value.length < 10) {
                      return 'Айди должно быть ровно 10 символов';
                    }
                    return null;
                  },
                  onChanged: _onTextChanged,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: _buttonReady ? _onSubmit : null,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(132.w, 24.h),
                maximumSize: Size(132.w, 24.h),
                backgroundColor: _buttonReady ? Color(0xFFEF8249) : Color(0x80EF8249),
                disabledBackgroundColor: Color(0x80EF8249),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
              ),
              child: Text(
                'Продолжить',
                style: AppStyles.taskText.copyWith(color: Colors.white, fontSize: 13.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
