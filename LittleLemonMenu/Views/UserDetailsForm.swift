//
//  RegistrationForm.swift
//  LittleLemonMenu
//
//  Created by Manuchimso Oliver on 04/02/2023.
//

import SwiftUI

enum UserDetailsFormType {
    case register
    case view
}

struct UserDetailsForm: View {
    let type: UserDetailsFormType
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var showErrorAlert = false
    @State private var showSavedSuccessAlert = false
    
    @AppStorage(AppConstants.kIsLoggedIn) var isLoggedIn: Bool = false
    @AppStorage(AppConstants.kFirstName) var savedFirstName: String = ""
    @AppStorage(AppConstants.KLastName) var savedLastName: String = ""
    @AppStorage(AppConstants.KEmail) var savedEmail: String = ""
    @AppStorage(AppConstants.KPhone) var savedPhone: String = ""
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func submit() {
        if (!firstName.isEmpty &&
            !lastName.isEmpty &&
            !email.isEmpty &&
            !phone.isEmpty &&
            isValidEmail(email)) {
            saveData()
        
            if type == .view {
                showSavedSuccessAlert.toggle()
            }
        } else {
            showErrorAlert.toggle()
        }
    }
    
    private func saveData() {
        UserDefaults.standard.set(firstName, forKey: AppConstants.kFirstName)
        UserDefaults.standard.set(lastName, forKey: AppConstants.KLastName)
        UserDefaults.standard.set(email, forKey: AppConstants.KEmail)
        UserDefaults.standard.set(phone, forKey: AppConstants.KPhone)
        isLoggedIn = true
    }
    
    private func loadSavedValues() {
        firstName = savedFirstName
        lastName = savedLastName
        email = savedEmail
        phone = savedPhone
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("First Name \(type == .register ? "*" : "")")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.gray)
        
            TextField("", text: $firstName)
                .textFieldStyle(.roundedBorder)
            
            Text("Last Name \(type == .register ? "*" : "")")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.gray)
        
            TextField("", text: $lastName)
                .textFieldStyle(.roundedBorder)
            
            Text("Email \(type == .register ? "*" : "")")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.gray)
        
            TextField("", text: $email)
                .keyboardType(.emailAddress)
                .textFieldStyle(.roundedBorder)
            
            Text("Phone \(type == .register ? "*" : "")")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.gray)
        
            TextField("", text: $phone)
                .keyboardType(.phonePad)
                .textFieldStyle(.roundedBorder)
            
            if type == .register {
                Button(action: {
                    submit()
                }, label: {
                    Text("Register")
                        .foregroundColor(.black)
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                })
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.secondaryColor)
                .cornerRadius(16)
                .padding(.top, 30)
            } else {
                EmailNotificationsView()
                    .padding(.top, 20)
                
                Button(action: {
                    isLoggedIn = false
                }, label: {
                    Text("Log out")
                        .foregroundColor(.black)
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                })
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.secondaryColor)
                .cornerRadius(16)
                .padding(.top, 30)
                
                HStack (alignment: .center, spacing: 20) {
                    Spacer()
                    Button(action: {
                        loadSavedValues()
                    }, label: {
                        Text("Discard Changes")
                            .foregroundColor(.gray)
                            .font(.body(size: 13))
                            .fontWeight(.bold)
                    })
                    .padding(15)
                    .border(Color.primaryColor, width: 1)
                    .padding(.top, 12)
                    
                    Button(action: {
                        submit()
                    }, label: {
                        Text("Save Changes")
                            .foregroundColor(.white)
                            .font(.body(size: 13))
                            .fontWeight(.bold)
                    })
                    .padding()
                    .background(Color.primaryColor)
                    .cornerRadius(16)
                    .padding(.top, 12)
                    
                    Spacer()
                }
            }
        }
        .alert("Please fill all fields with correct values", isPresented: $showErrorAlert) {
            Button("OK", role: .cancel) { }
        }
        .alert("Changes saved", isPresented: $showSavedSuccessAlert) {
            Button("OK", role: .cancel) { }
        }
        .onAppear(){
            if(type == .view) {
               loadSavedValues()
            }
        }
    }
}

struct RegistrationForm_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsForm(type: .register)
    }
}
