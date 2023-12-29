import 'package:eco_kg/feature/widgets/progressWidget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/payment_bloc.dart';
import 'package:auto_route/auto_route.dart';

class PaymentScreen extends StatefulWidget {

  PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  WebViewPlusController? _controller;
  int pageCounter=0;
  String? url;
  double webProgress=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if(state is LoadingPaymentState){
            return Center(child: progressWidget());
          }
          if(state is LoadedPaymentState){
            url=state.paymentEntity.paymentUrl;
          }
          return SafeArea(
            child: Stack(
              children: [
                WebViewPlus(
                  javascriptMode: JavascriptMode.unrestricted,
                  gestureNavigationEnabled: true,
                  onWebViewCreated: (controller) {
                    _controller = controller;
                  },
                  onProgress: (progress){
                    setState(() {
                      this.webProgress=progress/100;
                    });
                  },
                  initialUrl: url,
                  navigationDelegate: (NavigationRequest request) {
                    pageCounter++;
                    print(pageCounter);
                    if (pageCounter == 1) {
                      AutoRouter.of(context).pop();
                      return NavigationDecision.prevent;
                    }
                    return NavigationDecision.navigate;
                  },
                ),
                if(webProgress<1)
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Center(child: progressWidget()),
                ),
              ]
            ),
          );
        },
      ),
    );
  }
}