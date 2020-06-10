# Banked Checkout SDK
\
The Banked SDK offers an interface for processing a PaymentSession created using the Banked API.

## Installation
\
Use [Cocoapods](https://cocoapods.org/) to install the Banked Checkout SDK

To integrate Banked Checkout SDK into your Xcode project using CocoaPods, specify it in your Podfile:

```swift
pod ‘Banked’, :git => ‘https://github.com/banked/banked-iOS.git’
```

## Usage

### 1. Setup Universal Links for callbacks

Once a user has selected a bank from the list in the Checkout, they are re-directed to the Bank's Application (if installed) or website to authorise the payment. After authorisation is complete (or fails) we need to return the user to your application via a URL you provide - currently we support this via Universal Links

The reason we recommend Universal Links is that the PaymentSession _could_ be processed in an iOS app via the Checkout, or potentially on desktop (e.g. if you have a web version) - Universal Links mean that you can handle both scenarios as you see fit.

Once you setup Universal Links, the app can handle the incoming callback appropriately.

Please find more details about setting up Universal Links in the [Apple Developer Documentation](https://developer.apple.com/documentation/uikit/inter-process_communication/allowing_apps_and_websites_to_link_to_your_content) 


### 2. Import the library

After installing the pod, import the library.

```swift
@import Banked
```

### 3. Initialise the BankedCheckout

Depending on whether you are implementing a `test` or `production` checkout, enter the appropriate `client key` found in the [Banked Console](https://console.banked.com/client_keys)

```swift
BankedCheckout.setUp(clientKey: "CLIENT KEY")
```

### 4. Generate a PaymentSession

Use the `Banked API` to create a `PaymentSession`. Please read the API documentation for more detail - [Banked API - Generating a Payment Session](https://developer.banked.com/docs/getting-started#3-generate-a-payment-session)

IMPORTANT - You must provide callback URLs as part of the `PaymentSession` which will return your users to your application once they have authorised the payment. There are success and failure redirects which you can specify - but as the SDK retrieves the PaymentSession when handling the callback, and this already has a more detailed status, its simplest to provide one callback URL for both.

In order to handle the callback later, you will need the Payment ID - which is automatically added by Banked. However you must provide a templated URL for us to do this. Please use `__PAYMENT_ID__` to indicate where to include the Payment ID.

E.g. `https://mybusinessname.com/callback/__PAYMENT_ID__` or `https://mybusinessname.com/callback/?id=__PAYMENT_ID__`

You can choose not to use the templated URL - but in this case you would need to persist the Payment ID _after_ the PaymentSession is created and handle this independently. 

### 5. Present the BankedCheckout for your PaymentSession

Present the checkout *over* a specified ViewController. 

You *must* provide a Payment ID which is part of the PaymentSession you created via the API. This is used to retrieve the correct details for the Checkout.

Depending on network speed, the retrieval of the PaymentSession  will take a few moments before the User Interface is presented. We provide a delegate method `bankedCheckoutIsLoading(_ isLoading: Bool)` which returns the loading status - you can use this to present/hide a loading interface before the Checkout appears

The `action` is a `PaymentAction` which is used to customise the Checkout appropriately - for example the copy used to describe the purpose/intent of the payment.

The completion block returns a `CheckoutResponse` when the Checkout is either a `success` or `failure`. The `failure` response will contain a `BankedCheckoutError` which contains more detail as to why the error occurred.

```swift
BankedCheckout.presentCheckout(self, paymentId: "PAYMENT ID", action: .pay){ (response) in
    if response == .success {
      // Handle Success
    }
}
```

### 6. Handle callbacks after bank authorisation

Your Universal Links will automatically open the app after you leave the bank authorisation flow, and you need to handle this within the App Delegate. In the example below the callback URL set on the PaymentSession was `https://mybusinessname.com/callback/__PAYMENT_ID__`.

`BankedCheckout.shared.handlePaymentWithId("PAYMENT ID")` will retrieve the PaymentSession and then update the UI of the currently displayed Checkout. You will then receive a completion block with a `CheckoutResponse`.

```swift
func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?
    ) -> Void) -> Bool {
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
            let url = userActivity.webpageURL else {
            return false
        }
        
        // Callback URL is `https://mybusinessname.com/callback/1234567`

        if url.pathComponents.count == 2 {
            let paymentId = url.pathComponents[1]
            BankedCheckout.shared.handlePaymentWithId(paymentId) { response in
                print(response)
            }
        }
        return false
    }
```


### Optional - Setup a Delegate for the BankedCheckout

Your can adopt the BankedCheckoutDelegate protocol and assign a delegate. There is a single method which indicates the 'loading' status of the Checkout while it retrieves the PaymentSession. 

## Contributing
Please open an issue first to discuss what you would like to change.
