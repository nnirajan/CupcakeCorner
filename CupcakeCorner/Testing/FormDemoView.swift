//
//  FormDemoView.swift
//  CupcakeCorner
//
//  Created by ebpearls on 27/12/2022.
//

import SwiftUI

struct FormDemoView: View {
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create Account") {
                    print("create account")
                }
            }
            .disabled(validateForm())
        }
    }
    
    func validateForm() -> Bool {
        return username.isEmpty || email.isEmpty
    }
}

struct FormDemoView_Previews: PreviewProvider {
    static var previews: some View {
        FormDemoView()
    }
}
