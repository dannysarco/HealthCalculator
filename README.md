# HealthCalculator

HealthCalculator is a SwiftUI application I designed and created primarily for automated testing practice. It allows users to calculate their Body Mass Index (BMI) and Waist-to-Hip Ratio (WHR), providing a comprehensive interface for input validation and test case implementation.

## Features

- Input personal information including first name, age, and gender.
- Input body measurements including height, weight, chest, waist, and hip circumferences.
- Calculate and display BMI.
- Calculate and display Waist-to-Hip Ratio.
- Toggle between light and dark mode.
  


https://github.com/dannysarco/HealthCalculator/assets/54184032/33015c60-a094-4988-82f7-7112e0187717




## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/dannysarco/HealthCalculator.git
   ```

2. Open the project in Xcode:
   ```bash
   cd HealthCalculator
   open HealthCalculator.xcodeproj
   ```

3. Install dependencies (if any):
   ```bash
   pod install
   ```

## Running Tests

To run the tests, use the following command:

```bash
xcodebuild -workspace HealthCalculator.xcworkspace \
           -scheme HealthCalculator \
           -sdk iphonesimulator \
           -destination 'platform=iOS Simulator,name=iPhone 12,OS=latest' \
           clean test
```

## Contributing

Feel free to submit issues and pull requests. Contributions are welcome!

## License

This project is licensed under the MIT License - see the LICENSE file for details.
