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
\
Once a user has selected a bank from the list in the Checkout, they are re-directed to the Bank's Application (if installed) or website to authorise the payment. After authorisation is complete (or fails) we need to return the user to your application via a URL you provide - currently we support this via Universal Links

---
**TODO - Details from Tom/Kristina**
---

Please find more details about setting up Universal Links in the [Apple Developer Documentation](https://developer.apple.com/documentation/uikit/inter-process_communication/allowing_apps_and_websites_to_link_to_your_content) 


### 2. Import the library

After installing the pod, import the library.

```swift
@import Banked
```

### 3. Initialise the BankedCheckout

Depending on whether you are implementing a `test` or `production` checkout, enter the appropriate `client key` found in the [Banked Console](https://console.banked.com/client_keys)

```swift
BankedCheckout.setUp(dataAPIKey: "CLIENT KEY")
```

### 4. Generate a PaymentSession

Use the `Banked API` to create a `PaymentSession`. Please read the API documentation for more detail - [Banked API - Generating a Payment Session](https://developer.banked.com/docs/getting-started#3-generate-a-payment-session)

IMPORTANT - You must provide a callback URL as part of the `PaymentSession` which will return your users to your application once they have authorised the payment.

---
**TODO - Details from Tom/Kristina**
---

### 5. Present the BankedCheckout for your PaymentSession

Present the checkout *over* a specified ViewController. 

You *must* provide a Payment ID which is part of the PaymentSession you created via the API. This is used to retrieve the correct details for the Checkout.

Depending on network speed, the retrieval of the PaymentSession  will take a few moments before the User Interface is presented. We provide a delegate method `bankedCheckoutIsLoading(_ isLoading: Bool)` which returns the loading status - you can use this to present/hide a loading interface before the Checkout appears

The `action` is a `PaymentAction` which is used to customise the Checkout appropriately - for example the copy used to describe the purpose of the payment.

The completion block returns a `CheckoutResponse` when the Checkout is either a `success` or `failure`. The `failure` response will contain a `BankedCheckoutError` which contains more detail as to why the error occurred.

```swift
BankedCheckout.presentCheckout(self, paymentId: "PAYMENT ID", action: .pay){ (response) in
    if response == .success {
      // Handle Success
    }
}
```

### 6. Handle callbacks after bank authorisation

**TODO - Details from Tom/Kristina**


### Optional - Setup a Delegate for the BankedCheckout

Your can adopt the BankedCheckoutDelegate protocol and assign a delegate. There is a single method which indicates the 'loading' status of the Checkout while it retrieves the PaymentSession. 

## Contributing
Please open an issue first to discuss what you would like to change.

## License

DEVELOPER PLATFORM AGREEMENT

These terms and conditions (the “Agreement”) constitute an agreement between Banked Ltd, company number 11047186, with its registered office at Ground Floor, Finchale House, Belmont Business Park, Durham, England, DH1 1TW (“Banked”, “we”, “our” or “us”) and you, the legal entity or sole proprietor identified in connection with your registration of a developer account, (“you”, “your” or “yours”) governing your access to and use of Banked’s software, software developer kits, libraries, application programming interfaces, documentation, sample code, templates and related materials made available to you by Banked (the “Developer Materials”). By accepting this Agreement or by accessing and using the Developer Materials you agree to be bound by this Agreement. You may not use the Developer Materials if you do not accept this Agreement. If you are using the Developer Materials on behalf of a legal entity, you warrant that you have authority to bind that legal entity to this Agreement, and by accepting this Agreement, you are doing so on behalf of that legal entity.

1. License, Access and Use. Subject to the terms and conditions of this Agreement, Banked grants you a limited, revocable, non-exclusive, royalty-free, non-transferable, non-sub-licensable right and license to use the Developer Materials to access, use and reproduce those Developer Materials solely for the purposes of developing, testing, and promoting your websites, applications and services (“Applications”) as contemplated by the documentation for the applicable Developer Materials. You may use Developer Materials only in connection with Banked’s products and services for which they are made available. If the Developer Materials include any libraries, sample code, or other materials we make available specifically for incorporation in your Applications (as indicated by the applicable documentation), you may incorporate those materials in your Applications and reproduce and distribute those Developer Materials as incorporated in your Applications. You may also modify any such sample code to the extent necessary to incorporate it in your Applications. We may modify or discontinue (including by ceasing our distribution of or support for) any or all of the Developer Materials at any time without notice and you are solely responsible for ensuring that your Applications function properly after any such modification or discontinuation. You will not misrepresent or mask either your identity or your Applications when using the Developer Materials or your developer account. If Banked believes that you have attempted to exceed or circumvent these limitations, your ability to use the Developer Materials may be temporarily or permanently blocked. You will not use the Developer Materials to encourage or promote illegal activity. You agree that Banked may monitor your use of the Developer Materials to ensure quality, improve Banked’s products and services, and to verify your compliance with this Agreement. This monitoring may include Banked accessing and using your Applications to identify security issues that could affect Banked or its users. Banked may suspend access to the Developer Materials by you or your Applications without notice if Banked reasonably believes that you are in violation of this Agreement. The Developer Materials may include or be distributed with software or other materials that are provided under a separate license agreement (such as an open source license), and that separate license will govern the use of such software or other materials in the event of a conflict with this Agreement. Any such separate license agreement may be indicated in the license, notice, or readme files distributed with the applicable software or other materials or in related documentation.

2. Prohibitions and Limitations. You may use the Developer Materials only as expressly authorized under this Agreement only for the purpose of developing, testing, and promoting your Applications as permitted by section 1, and only through the interfaces and functionality we designate. You must comply with all instructions and requirements in any integration documents, guidelines or other documentation that we provide. Except as permitted under section 1, you will not: a) incorporate or compile any portion of the Developer Materials into your Applications or other digital or physical products, b) distribute, sub-license or otherwise provide any portion of the Developer Materials to any third party, c) modify or create derivative works of the Developer Materials, d) reverse engineer, disassemble or decompile the Developer Materials, e) create any Application that functions substantially in the same way as the Developer Materials and distribute, sub-license or otherwise provide it to any third party, f) perform any action with the intent of introducing to the Developer Materials or any of Banked’s products or services any viruses, worms, defects, trojan horses, malware, or any items of a destructive nature, g) remove, obscure, or alter any Banked terms of service or any links to or notices of such terms, or h) access the Developer Materials or any of Banked’s products or services for competitive purposes (including to connect to a competitive product or to create your own competitive product) or publicly disseminate performance information or analysis (including uptime, response time and/or benchmarks) relating to the Developer Materials or any of Banked’s products or services. You may not use the Developer Materials with any software or other materials that are subject to licenses or restrictions (e.g., open source software licenses) that, when combined with the Developer Materials, would require us to disclose, license, distribute or otherwise make all or any part of such Developer Materials available to anyone. You may not remove, modify, or obscure any copyright, patent, trademark or other proprietary or attribution notices on or in any Developer Materials. All licenses and rights granted to you in this Agreement are conditional on your continued compliance with this Agreement, and all such licenses and rights will immediately and automatically terminate if you do not comply with any term or condition of this Agreement.

3. Security. You are fully responsible for the security of all data processed via your Applications.

5. Intellectual Property Rights. As between you and Banked, Banked owns all rights, title, and interest, including all intellectual property rights, in and to the Developer Materials, Banked’s Brand Features, Banked’s products and services, and all related technology, websites and content, and any modifications or derivative works of the foregoing (together, the “Banked Intellectual Property Rights”). Except for the limited rights expressly granted to you under this Agreement or any other agreement in force between Banked and you, Banked does not grant you any right, title, or interest in or to any Banked Intellectual Property Rights. If you provide Banked with any feedback concerning the Developer Materials or Banked’s products or services, you grant Banked a worldwide, royalty-free, non-exclusive, perpetual and irrevocable right and license to use, copy, modify, sublicense and otherwise exploit such feedback for any purpose, without any restriction or obligation to you based on intellectual property rights or otherwise. As between you and Banked, you own all rights, title, and interest, including all intellectual property rights, in and to your Applications. During the term of this Agreement you grant Banked a non-exclusive, worldwide, irrevocable, royalty-free right and license, under all of your intellectual property rights, to use, perform, and display your Application and its content for purposes of internal testing (including security testing). Banked may be independently creating (or may receive from third parties) features, applications or other products or services that may be similar to or competitive with your Applications, and nothing in this Agreement or any other agreement in force between Banked and you will be construed as restricting or preventing Banked from doing so.

6. Branding and Publicity. This Agreement does not grant either party any right, title or interest in or to the other party’s trade names, trademarks, service marks, logos, domain names, and other distinctive brand features (“Brand Features”). You may not use Banked’s Brand Features without Banked’s prior written consent. Any permitted use by you of Banked’s Brand Features will at all times comply with Banked brand guidelines, and any other instructions given by Banked from time to time. You acknowledge and agree that Banked has the sole discretion to determine whether your use of Banked’s Brand Features comply with the said brand guidelines and instructions. You may promote your Application, including talking to traditional and online media and your users about your Application, but you may not issue any formal press release via traditional or online media referring to Banked without Banked’s prior written consent. You must conduct all such activities truthfully and without implying that your Application is created, sponsored, or endorsed by Banked and you may not make any representations, guarantees or warranties on behalf of Banked or with respect to the Developer Materials or Banked’s products or services. Banked may publicly refer to you as a user of the Developer Materials and for such purposes publish your Brand Features on Banked’s websites, in press releases, and in promotional materials without your prior consent.

7. Amendments and Modifications. Banked may amend this Agreement or any part thereof from time to time to, for example, reflect changes in applicable law or modifications to the Developer Materials. Changes will become effective thirty (30) days after they are notified to you, provided however, that changes addressing modifications to the Developer Materials or changes made for legal reasons will be effective immediately. You acknowledge and agree that such changes may adversely affect how your Application accesses or communicates with the Developer Materials. If any change is unacceptable to you, your only recourse is to terminate this Agreement by ceasing all use of the Developer Materials. Your continued use of the Developer Materials will constitute binding acceptance of any change. While Banked may provide you with support or modifications to the Developer Materials, Banked is under no obligation to do so and have no obligation to fix or respond to errors you may encounter. Without any liability to you, Banked may in its discretion add, remove or modify any features of the Developer Materials, impose additional eligibility requirements or restrictions for access to the Developer Materials or discontinue providing the Developer Materials. If Banked modifies the Developer Materials, Banked may require you to use the modified version in order to continue using the Developer Materials.

8. Disclaimer. The Developer Materials is provided and licensed to you on an "as is" and “as available” basis. Banked and its third party licensors disclaims any and all representations, warranties and conditions, either express, implied or statutory, including without limitation any warranties or conditions of title, non-infringement, merchantability, functionality or fitness for a particular purpose. All use of the Developer Materials is at your own risk, and you are solely responsible for your use of the Developer Materials, your Applications and any data, content or information that you access, retrieve, process and use with the Developer Materials. You assume all risks associated with your use of the Developer Materials, including but not limited to the risks and costs of program errors, compliance with applicable laws, damage to or loss of data, programs, or equipment, and unavailability or interruption of operations.

9. Limitation of Liability. To the maximum extent permitted by applicable law, in no event will Banked, its processors, suppliers, or licensors (or their respective affiliates, agents, directors, and employees) be liable for any direct, indirect, punitive, incidental, special, consequential, or exemplary damages, including without limitation damages for loss of profits, goodwill, use, data, or other intangible losses, that result from the use of, inability to use, or unavailability of the Developer Materials. Under no circumstances will Banked be responsible for any damage, loss, or injury resulting from hacking, tampering, or other unauthorized access or use of the Developer Materials. Banked, its processors, its suppliers, and its licensors (and their respective affiliates, agents, directors, and employees) assume no liability or responsibility for any: a) errors, mistakes, or inaccuracies of the Developer Materials, b) personal injury or property damage, of any nature whatsoever, resulting from your access to or use of the Developer Materials, c) any unauthorized access to or use of Banked’s secure servers and/or any and all personal information stored therein, d) any interruption or cessation of transmission to or from the Developer Materials, e) any bugs, viruses, trojan horses, or the like that may be transmitted to or through the Developer Materials by any third party, f) any errors or omissions in any content or data or for any loss or damage incurred as a result of the use of any content or data posted, emailed, transmitted, or otherwise made available through the Developer Materials, or g) your Applications.  The foregoing limitation of liability will apply to the fullest extent permitted by law in the applicable jurisdictions.

10. Indemnification. You will indemnify, defend, and hold Banked, its processors, suppliers, and licensors (and their respective affiliates, agents, directors, and employees) harmless from and against any and all claims, costs, losses, damages, judgments, tax assessments, penalties, interest, and expenses (including without limitation reasonable attorneys' fees) arising out of any claim, action, audit, investigation, inquiry, or other proceeding instituted by a person or entity that arises out of or relates to: a) any actual or alleged breach of your warranties or obligations under this Agreement, b) your wrongful or improper use of the Developer Materials, c) your Applications and your use of the Developer Materials together with your Applications, d) your actual or alleged violation of any third- party right, including without limitation any right of privacy, publicity rights or intellectual property rights, e) your violation of any applicable law, rule or regulation, or f) any other party's access and use of the Developer Materials with your developer credentials. Banked may at its own expense participate in the defense and settlement of any claim with its own counsel, and you may not settle a claim without Banked’s prior written consent.

11. Confidentiality. You acknowledge that you may gain access to and receive information from Banked that is confidential or proprietary, including your developer credentials, materials, communications, and information that are marked confidential or proprietary or that you should reasonably understand to be confidential or proprietary under the circumstances (”Confidential Information”). You may not disclose any Confidential Information to third parties, other than your employees, agents and advisors on a strict need to know basis for whom you agree to remain responsible under this Agreement. You agree to protect all Confidential Information using at least the same degree of care that you use to protect your own confidential information, however not less than a reasonable degree of care. You agree to use Confidential Information solely for the purpose of exercising your rights and performing your obligations under this Agreement and agree not to use the Confidential Information for any other purpose, without Banked’s prior written consent. Your confidentiality obligation will not apply to Confidential Information which you can evidence: a) is or has becomes public knowledge other than through a breach of this Agreement, or b) is to be made publicly available due to a court order, a decision by a public body or as otherwise required by mandatory law. Your obligations of confidentiality hereunder will survive the termination of this Agreement.

12. Term and Termination. This Agreement remains in effect until terminated. You may terminate this Agreement at any time by ceasing all use of the Developer Materials. Save as provided for under any agreement in force between Banked and you, Banked may terminate this Agreement for any reason and at any time upon seven (7) days’ notice to you without any liability or other obligation to you. In addition, Banked may terminate this Agreement or your access to and use of the Developer Materials if: a) you have breached any term of this Agreement or any other agreement in force between Banked and you, b) Banked ceases to provide the Developer Materials, or c) as required by applicable law. Upon any termination of this Agreement, all rights and licenses granted to you will terminate immediately and you must stop using the Developer Materials and all Banked materials. Banked may independently communicate with any Banked users whose accounts are associated with your Applications and developer credentials to provide notice of the termination of your right to use the Developer Materials.

13. Severability. If any provision of this Agreement is or becomes invalid, illegal or unenforceable, it shall be deemed modified to the minimum extent necessary to make it valid, legal and enforceable. If such modification is not possible, the relevant provision shall be deemed deleted. Any modification to or deletion of a provision of this Agreement shall not affect the validity and enforceability of the rest of this Agreement.

14. Assignment. You may not assign or transfer any rights or obligations under this Agreement without Banked ́s prior written consent. Banked may freely assign and transfer this Agreement or any of its rights and obligations hereunder without your consent or any other restrictions.

15. No waiver. Failure by Banked at any time or times to require performance of any provisions of this Agreement will in no manner affect its right to enforce such provisions, and the waiver by Banked of any breach of any provision of this Agreement will not be construed to be a waiver by Banked of any subsequent breach of such provision or waiver by Banked of any breach of any other provision hereof.

16. Legal Relationship. Nothing in this Agreement is intended to, or shall be deemed to, establish any partnership, agency or joint venture between the parties, constitute either party the agent of the other, nor authorise a party to make or enter into any commitments for or on behalf of the other party. Each party is solely responsible and liable for its own dealings and agreements with its users. Any users’ access to and use of your Applications is subject to your service terms or other applicable terms agreed between you and your users. Similarly, any users’ access to and use of Banked’s products or services is subject to Banked’s service terms or other applicable terms agreed between Banked and its users.

17. Governing law and dispute resolution. This Agreement and any dispute or claim arising out of or in connection with it (including non contractual disputes or claims) shall be governed by and construed in accordance with the laws of England, with the exclusion of its conflict of law rules.
