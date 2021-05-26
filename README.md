# Banked Checkout SDK
\
The Banked SDK offers an interface for processing a PaymentSession created using the Banked API.

You can find more information about Banked in our [Developer Docs](https://developer.banked.com/docs/introduction), including a guide on how to set up Payment Sessions.

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
BankedCheckout.shared.setUp(clientKey: "CLIENT KEY")
```

### 4. Generate a PaymentSession

Use the `Banked API` to create a `PaymentSession`. Please read the API documentation for more detail - [Banked API - Generating a Payment Session](https://developer.banked.com/docs/getting-started#3-generate-a-payment-session)

You do not need to provide the callback URLs when creating the PaymentSession - this will be handled in the next step when presenting your checkout to the user. 

### 5. Present the BankedCheckout for your PaymentSession

Present the checkout *over* a specified ViewController. 

You *must* provide a Payment ID which is part of the PaymentSession you created via the API. This is used to retrieve the correct details for the Checkout.

Depending on network speed, the retrieval of the PaymentSession will take a few moments before the User Interface is presented. We provide a delegate method bankedCheckoutIsLoading(_ isLoading: Bool) which returns the loading status - you can use this to present/hide a loading interface before the Checkout appears

The action is a PaymentAction which is used to customise the Checkout appropriately - for example the copy used to describe the purpose/intent of the payment. The four available options are: pay, donate, send and transfer.

You will also need to specify a continueURL - this will be used to redirect your users to once the payment has succeeded or failed.

```swift
BankedCheckout.shared.presentCheckout(self, paymentId: "PAYMENT ID", action: .pay, continueURL: "example.com"){ (response) in
    switch response {
        case .success:
            // Handle success
        case .failure(let error):
            // Handle failure with error
    }
}
```

### 6. Handle callbacks after bank authorisation

Your Universal Links will automatically open the app after you leave the bank authorisation flow, and you need to handle this within the App Delegate. In the example below the callback URL set on the PaymentSession was https://example.com.

Once a user is redirected back into your app after payment authorisation, retrieve the URL they were redirected on, and pass it to BankedCheckout.shared.handlePaymentWithId("REDIRECT_URL", .pay). The second argument is the payment action that was specified in step 5.

```swift
BankedCheckout.shared.handlePaymentWithURL(url, action: .pay)  { response in
    switch response {
        case .success:
            // Handle success
        case .failure(let error):
           // Handle failure with error
    }
}
```

### Optional - Setup a Delegate for the BankedCheckout

Your can adopt the BankedCheckoutDelegate protocol and assign a delegate. There is a single method which indicates the 'loading' status of the Checkout while it retrieves the PaymentSession. 

## Contributing
Please open an issue first to discuss what you would like to change.
