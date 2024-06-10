import SwiftUI

struct ContentView: View {
    @State private var userData = UserData()
    @State private var bmiResult: String = ""
    @State private var whrResult: String = ""
    @State private var isDarkMode: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("First Name", text: $userData.firstName)
                    TextField("Age", text: $userData.age)
                    Picker("Gender", selection: $userData.gender) {
                        Text("Male").tag("Male")
                        Text("Female").tag("Female")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Body Measurements")) {
                    HStack {
                        TextField("Height (ft)", text: $userData.heightFeet)
                        TextField("Height (in)", text: $userData.heightInches)
                    }
                    TextField("Weight (lbs)", text: $userData.weightPounds)
                }

                Section(header: Text("Optional Measurements")) {
                    TextField("Chest Circumference", text: $userData.chestCircumference)
                    TextField("Waist Circumference", text: $userData.waistCircumference)
                    TextField("Hip Circumference", text: $userData.hipCircumference)
                }

                Section {
                    Button("Calculate BMI") {
                        calculateBMI()
                    }
                    Text("BMI: \(bmiResult)")
                }

                Section {
                    Button("Calculate Waist-to-Hip Ratio") {
                        calculateWHR()
                    }
                    Text("Waist-to-Hip Ratio: \(whrResult)")
                }

                Section {
                    Toggle("Dark Mode", isOn: $isDarkMode)
                        .onChange(of: isDarkMode) {
                            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                                for window in windowScene.windows {
                                    window.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
                                }
                            }
                        }
                }
            }
            .navigationTitle("Health Calculator")
        }
    }

    func calculateBMI() {
        guard let heightFeet = Double(userData.heightFeet),
              let heightInches = Double(userData.heightInches),
              let weightPounds = Double(userData.weightPounds) else {
            bmiResult = "Invalid input"
            return
        }

        let totalHeightInches = (heightFeet * 12) + heightInches
        let heightMeters = totalHeightInches * 0.0254
        let weightKg = weightPounds * 0.453592

        let bmi = weightKg / (heightMeters * heightMeters)
        bmiResult = String(format: "%.2f", bmi)
    }

    func calculateWHR() {
        guard let waist = Double(userData.waistCircumference),
              let hip = Double(userData.hipCircumference) else {
            whrResult = "Invalid input"
            return
        }

        let whr = waist / hip
        whrResult = String(format: "%.2f", whr)
    }
}
