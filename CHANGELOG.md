# Banked Checkout SDK Changelog

## 0.0.38
December 14, 2023

### New Features
* Added support for Ireland
## 0.0.37
November 1, 2023

### New Features
* Added support for end to end id

## 0.0.36
August 30, 2023

### New Features
* Added support for Dutch language

## 0.0.35
July 7, 2023

### Bug Fixes
* Fixed occasional crash when filtering providers while using auto-correction.

## 0.0.34
June 16, 2023

### New Features
* Enhanced Setup Method: The setup method now includes an optional countryCode parameter. This parameter can be used to sort payment providers based on the country code. If the countryCode parameter is not provided, the providers will be sorted based on the default setting.

* Improved Payment Status Retrieval: A new polling process has been introduced for retrieving the final state of a payment after it is sent. The framework will make several attempts over approximately 10 seconds to fetch the latest status. This ensures that the app has the most up-to-date information regarding the payment's state, improving the user experience.

## 0.0.33
April 21, 2023

### Bug Fixes
* Fixed issue that allowed presenting the framework twice, which caused side effects. 
Now, an error will be triggered if user tries to call the framework and it is already loaded.

## 0.0.32
April 6, 2023

### New Features
* Added support for French and Spanish languages.

### Bug Fixes
* Fixed an issue with brand name that caused an infinite spinner when checking a payment again in some cases random cases.

### Deprecations
* Deprecated support from Donation, Transfer and Send actions. Now all actions are Pay, even if we pass a different value.
It is recommended to start using modern methods without "action" parameter.

## 0.0.31
February 16, 2023

### Bug Fixes
* Fixed framework version in request headers.

## 0.0.30
February 10, 2023

### New Features
* Added support to Germany/IBAN.

### Bug Fixes
* Added a retry screen when payment confirmation fails.

## 0.0.29
February 6, 2023

### New Features
* This version removes Sentry dependency, needed for some clients. Use version 0.0.28 if this is not required in your case.

## 0.0.28
October 26, 2022

### Bug Fixes
* Fix platform version when reporting.

## 0.0.27
May 21, 2022

### Bug Fixes
* Fix result callback called twice in some scenarios.

## 0.0.26
April 9, 2022

### Bug Fixes
* Fix copy pre-handoff about bank details never being stored.

## 0.0.25
March 4, 2022

### Bug Fixes
* Fix RewardAvailableView layout.

## 0.0.24
March 1, 2022

### Bug Fixes
* Better tappable area for the info button. RewardAvailableView.
* Up to 2 lines in the reward title. RewardAvailableView.

## 0.0.23
January 30, 2022

### Bug Fixes
* Fix configuration to support Apple Silicon.

### New Features
* Update Sentry from 7.8.0 to 7.9.0 

## 0.0.22
January 15, 2022

### Bug Fixes
* Fix BITCODE issue.

## 0.0.21
January 12, 2022

### New Features
* Move to XCFramework format. 
* Support for simulators under M1 computers.

## 0.0.20
November 09, 2021

### Bug Fixes
* Added support for Module Stability

## 0.0.19
October 06, 2021

### New Features
* Add new error for abort payments

### Bug Fixes
* Fix a crash when unavailable bank is selected

## 0.0.18
September 01, 2021

### Bug Fixes
* Fix a bug with iOS 11.0 compatibility. 

## 0.0.17
September 01, 2021

### New Features
* Close authenticated payments automatically
* Change Terms and conditions acceptance logic

## 0.0.16
June 30, 2021

### New Features
* Compatible with iOS 11.0 or later.

## 0.0.9
May 26, 2021

### New Features
* Add initial loading screen.
* Add internal error reporting.
* UI and UX improvements.

### Bug Fixes
* Clean up build.
