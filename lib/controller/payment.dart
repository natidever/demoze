import 'package:chapa_unofficial/chapa_unofficial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class paymentController extends GetxController {
  // HttpServices? httpServices;
  RxBool walletInfoIsLoading = true.obs;
  RxBool networkException = false.obs;
  RxBool isTransactionLoading = true.obs;
  RxBool chapaWebViewIsLoading = false.obs;
  RxBool isVerificationResultLoading = true.obs;
  Map<String, dynamic>? verificationResult;
  RxString walletAmount = '0'.obs;
  RxString? addedMoney = ''.obs;
  RxString? transaction_reference = ''.obs;

  Future<void> addMoneyToWallet(
      BuildContext context, String userEnteredAmount) async {
    try {
      String txRef = TxRefRandomGenerator.generate(prefix: 'Pharmabet');
      String storedTxRef = TxRefRandomGenerator.gettxRef;
      print('Generated TxRef: $txRef');
      print('Stored TxRef: $storedTxRef');

      String? paymentUrl = await Chapa.getInstance.startPayment(
          // returnUrl: '/wallet',

          callbackUrl:
              "https://api.chapa.co/v1/transaction/verify/$storedTxRef",
          context: context,
          txRef: storedTxRef,
          amount: '15000',
          currency: 'ETB',
          enableInAppPayment: true,
          onInAppPaymentSuccess: (successMsg) async {
            Get.toNamed('success');
            print('successMsg $successMsg');
            //verify the payment fucntion run
            verificationResult = await Chapa.getInstance.verifyPayment(
              txRef: storedTxRef ?? '',
            );
            isVerificationResultLoading.value = false;
            verificationResult?.values.forEach((element) {
              print('element$element');
            });

            int? walletMoney = verificationResult?['data']['amount'];

            addedMoney?.value =
                verificationResult?['data']['amount'].toString() ?? '';
            transaction_reference?.value =
                verificationResult?['data']['reference'];
            print('${addedMoney} andpoint ${transaction_reference?.value}');

            String sentAmount = walletMoney.toString();
            // print('SentAmount:$sentAmount');
            // int walletId = tokenBox.read('wallet_id');
            // print('walletId:$walletId');

            // final response = await updateWalletForDeposit(sentAmount);
            // print('backend response $response');

            // final walletResponse = await getWalletInformations();
            // walletAmount.value = walletResponse.balance;
            // print('finalWalletResponse :${walletAmount.value}');

            // print('backendresponse:${response}');
            //redirect to success page
          },
          onInAppPaymentError: (errorMsg) {
            print('errorMsg $errorMsg');
          });

      print('Transaction finished:$paymentUrl');
    } on ChapaException catch (e) {
      if (e is AuthException) {
        print('In app $e ');
      } else if (e is InitializationException) {
        print('In app $e ');
      } else if (e is NetworkException) {
        //show popup
        networkException.value = true;
        print('In app $e ');
      } else if (e is ServerException) {
        print('In app $e ');
      } else {
        print('Unknown error occurs duing Adding Money to Wallet');
      }
    }
  }
}
