import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:rhea_ai_website/ui_component/util/utils.dart';

class BetaSubscription extends StatefulWidget {
  const BetaSubscription({super.key});

  @override
  State<BetaSubscription> createState() => _BetaSubscriptionState();
}

class _BetaSubscriptionState extends State<BetaSubscription> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isSubmitting = false;
  bool _isSubmittedSuccessfully = false;

  void onEmailSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      final email = _emailController.text;
      final name = _nameController.text;
      final String apiUrl =
          'https://55phj1v7dk.execute-api.eu-north-1.amazonaws.com/prod/SubsribeToNewsletter';

      try {
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'email': email,
            'name': name,
          }),
        );
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode == 200) {
          setState(() {
            _isSubmitting = false;
            _isSubmittedSuccessfully = true;
          });
        } else {
          setState(() {
            _isSubmitting = false;
          });
        }
      } on TimeoutException {
        setState(() {
          _isSubmitting = false;
        });
        print('Request timed out');
      } catch (e) {
        setState(() {
          _isSubmitting = false;
        });
        print('Failed to submit: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('JOIN BETA TESTER COMMUNITY',
            style: GoogleFonts.orbitron(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w300)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            'Join our beta program and shape the evolution of personalized fitness.',
            style: GoogleFonts.exo2(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w300),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: SizedBox(
            width: deviceSize.width * 0.4,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8)),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(32, 12, 4, 12),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            label: Text('Enter your name',
                                style: GoogleFonts.exo2(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300))),
                        style: RheaWebFont.regularFont,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8)),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(32, 12, 4, 12),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            label: Text('Enter your email',
                                style: GoogleFonts.exo2(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300))),
                        style: RheaWebFont.regularFont,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: _isSubmitting ? null : onEmailSubmit,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff0D1B3C),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _isSubmitting
                        ? 'Submitting...'
                        : _isSubmittedSuccessfully
                            ? 'Submitted Successfully'
                            : 'Submit',
                    style: GoogleFonts.exo2(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  ),
                  if (_isSubmitting)
                    const SizedBox(width: 10),
                  if (_isSubmitting)
                    const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
} 