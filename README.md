# Banked Checkout SDK

The Banked SDK offers an interface for processing a PaymentSession created using the Banked API.

## Installation

Use [Cocoapods](https://cocoapods.org/) to install the Banked Checkout SDK

To integrate Banked Checkout SDK into your Xcode project using CocoaPods, specify it in your Podfile:

```swift
pod ‘Banked’, :git => ‘https://github.com/banked/banked-iOS.git’
```

## Usage

### 1. Register a URL Scheme for callbacks
\
Once a user has selected a bank from the list, they are re-directed to the Bank's App (if installed) or website to authorise the payment. Once this is complete (or cancels/fails) we re-direct *back* to your application where you can handle this (usually in your App Delegate)\
\
An example of a custom URL scheme might be `my-app-name-banked://` - it is worth noting that other developers will be using the Banked SDK - so adding your app name rather than just 'banked' will avoid any conflicts :-)
\
Please find more details in the [Apple Developer Documentation](https://developer.apple.com/documentation/uikit/inter-process_communication/allowing_apps_and_websites_to_link_to_your_content/defining_a_custom_url_scheme_for_your_app) 


### 2. Import the library
\
After installing the pod, import the library.

```swift
@import Banked
```

### 3. Initialise the BankedCheckout
\
Depending on whether you are implementing a `test` or `production` checkout, enter the appropriate `client key` found in the [Banked Console](https://console.banked.com/client_keys)

```swift
BankedCheckout.setUp(dataAPIKey: "CLIENT KEY")
```

### 4. Generate a PaymentSession
\
Use the `Banked API` to create a `PaymentSession`. Please read the API documentation for more detail - [Banked API - Generating a Payment Session](https://developer.banked.com/docs/getting-started#3-generate-a-payment-session)

IMPORTANT - You must provide a callback URL as part of the `PaymentSession` which will return your users to your application once they have authorised the payment.\
\
This uses the custom URL Scheme you setup previously. We recommend including the Payment ID as part of the callback in order to easily handle the incoming re-directs\
\
An example of this might be `my-app-name-banked://callback/<PAYMENT ID>`

### 5. Present the BankedCheckout for your PaymentSession
\
Present the checkout *over* a specified ViewController. \
\
You *must* provide a Payment ID which is part of the PaymentSession you created via the API. This is used to retrieve the correct details for the Checkout.\
\
Depending on network speed, the retrieval of the PaymentSession  will take a few moments before the User Interface is presented. We provide a delegate method `bankedCheckoutIsLoading(_ isLoading: Bool)` which returns the loading status - you can use this to present/hide a loading interface before the Checkout appears\
\
The `action` is a `PaymentAction` which is used to customise the Checkout appropriately - for example the copy used to describe the purpose of the payment.\
\
The completion block returns a `CheckoutResponse` when the Checkout is either a `success` or `failure`. The `failure` response will contain a `BankedCheckoutError` which contains more detail as to why the error occurred.

```swift
BankedCheckout.presentCheckout(self, paymentId: "PAYMENT ID", action: .pay){ (response) in
    if response == .success {
      // Handle Success
    }
}
```

### 6. Handle callbacks after bank authorisation

TODO



### Optional - Setup a Delegate for the BankedCheckout
\
Your can adopt the BankedCheckoutDelegate protocol and assign a delegate.\
\
There is a single method which indicates the 'loading' status of the Checkout while it retrieves the PaymentSession. 

## Contributing
Please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
