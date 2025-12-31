import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trading_app/core/constants/color_constants.dart';
import 'package:trading_app/core/widgets/custom_button.dart';
import 'package:trading_app/core/widgets/text_widgets.dart';
import 'package:trading_app/core/widgets/widgets.dart';

class PaymentSupportForm extends StatefulWidget {
  const PaymentSupportForm({super.key});

  @override
  State<PaymentSupportForm> createState() => _PaymentSupportFormState();
}

class _PaymentSupportFormState extends State<PaymentSupportForm> {
  final w = Get.width;
  String? selectedInvoice;
  List<String> invoices = ['Invoice 001', 'Invoice 002', 'Invoice 003'];
  String? uploadedFile;

  @override
  Widget build(BuildContext context) {
    final h = Get.height;
    return Scaffold(
      appBar: AppBar(
        title: Texts.textMedium("Payment Support Form",
            size: h * .02, color: ColorConstants.primaryColor),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Widgets.heightSpaceH5,

            // Invoice Dropdown
            Texts.textMedium(
              "Invoice Id",
              color: ColorConstants.primaryColor,
              fontWeight: FontWeight.w500,
              size: w * 0.04,
            ),

            Widgets.heightSpaceH1,

            DropdownButtonFormField<String>(
              value: selectedInvoice,
              items: invoices
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: TextStyle(color: ColorConstants.primaryColor),
                      )))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedInvoice = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              ),
            ),
            Widgets.heightSpaceH50,

            // Account Verification / Upload
            Text.rich(
              TextSpan(
                text: "Account Verification ",
                style: TextStyle(
                    color: ColorConstants.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: w * 0.037),
                children: [
                  TextSpan(
                    text: ": Attach a Screenshot or Bank statement",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: ColorConstants.primaryColor,
                        fontSize: w * 0.027),
                  ),
                ],
              ),
            ),
            Widgets.heightSpaceH1,
            GestureDetector(
              onTap: () {
                // TODO: Implement file picker logic here
              },
              child: Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConstants.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/upload_icon.svg', // replace with your upload icon
                      height: 40,
                      color: ColorConstants.primaryColor,
                    ),
                    Widgets.heightSpaceH5,
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "Drag & Drop Here ",
                              style: TextStyle(
                                color: ColorConstants.primaryColor,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                            text: "or ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: ColorConstants.primaryColor,
                            ),
                          ),
                          TextSpan(
                              text: "Upload Files",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorConstants.primaryColor,
                              )),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Widgets.heightSpaceH2,
                    Text(
                      "JPG, PDF, PNG, WEBM, MAX 20 MB",
                      style: TextStyle(
                          fontSize: 12,
                          color: ColorConstants.primaryColor.withOpacity(.6)),
                    )
                  ],
                ),
              ),
            ),
            Widgets.heightSpaceH50,

            // Submit & Cancel Buttons
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                  label: "Cancel",
                  borderWidth: 1,
                  borderColor: ColorConstants.primaryColor,
                  backgroundColor: ColorConstants.whiteColor,
                  shadow: [],
                  textColor: ColorConstants.primaryColor,
                  onTap: () {},
                )),
                Widgets.widthSpaceW4,
                Expanded(
                    child: CustomButton(
                  label: "Submit",
                  borderWidth: 1,
                  borderColor: ColorConstants.primaryColor,
                  backgroundColor: ColorConstants.primaryColor,
                  shadow: [],
                  textColor: ColorConstants.whiteColor,
                  onTap: () {},
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
