import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/theme/units.dart';
import 'package:dooit/utils/back_navigation_wrapper.dart';
import 'package:dooit/utils/snackbar_helper.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dooit/widgets/custom_button.dart';
import 'package:dooit/widgets/labeled_text_field.dart';
import 'package:dooit/widgets/deadline_picker_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _deadline;
  DateTime? _lastBackPressTime;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _onPopInvokedWithResult(bool didPop, Object? result) {
    if (didPop) return;
    final now = DateTime.now();
    if (_lastBackPressTime == null ||
        now.difference(_lastBackPressTime!) > const Duration(seconds: 2)) {
      _lastBackPressTime = now;
      showSmallSnackBar(
        context,
        "Exit Screen",
        "Press back again to discard",
        contentType: ContentType.warning,
      );
    } else {
      Navigator.of(context).pop(true);
    }
  }

  Future<void> _pickDeadline() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: _deadline ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );
    if (!mounted || date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: _deadline != null
          ? TimeOfDay.fromDateTime(_deadline!)
          : TimeOfDay.now(),
    );
    if (time == null) return;

    setState(() {
      _deadline = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  String _deadlineLabel() {
    if (_deadline == null) return "Select date and time";
    return DateFormat('hh:mm a • dd MMM, yyyy').format(_deadline!);
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      showSmallSnackBar(
        context,
        "Invalid Input",
        "Please fill in all fields correctly",
        contentType: ContentType.failure,
      );
      return;
    }
    showSmallSnackBar(
      context,
      "Almost there",
      "We’ll hook this up to storage next",
      contentType: ContentType.help,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvokedWithResult,
      child: BackNavigationWrapper(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text("Add task", style: AppText.h2),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: AppUnits.hx24,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppUnits.y20,
                      LabeledTextField(
                        label: "Task title",
                        hint: "eg Buy a bike",
                        controller: _titleController,
                        validator: (v) => (v == null || v.trim().isEmpty)
                            ? "Title is required"
                            : null,
                      ),
                      AppUnits.y16,
                      LabeledTextField(
                        label: "Task description",
                        hint: "Enter description",
                        controller: _descriptionController,
                        maxLines: 4,
                        validator: (v) => (v == null || v.trim().isEmpty)
                            ? "Description is required"
                            : null,
                      ),
                      AppUnits.y16,
                      DeadlinePickerField(
                        label: "Set deadline",
                        value: _deadlineLabel(),
                        onTap: _pickDeadline,
                      ),
                      AppUnits.y40,
                      CustomButton(label: "Add task", onTap: _submit),
                      AppUnits.y20,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
