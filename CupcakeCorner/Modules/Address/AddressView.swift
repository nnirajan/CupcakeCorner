//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by ebpearls on 28/12/2022.
//

import SwiftUI

struct AddressView: View {
    // MARK: properties
    @ObservedObject var viewModel: AddressViewModel
    
    // MARK: body
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $viewModel.order.name)
                
                TextField("Street Address", text: $viewModel.order.streetAddress)
                
                TextField("City", text: $viewModel.order.city)
                
                TextField("Zip", text: $viewModel.order.zip)
            }
            
            Section {
                NavigationLink("Checkout") {
                    CheckoutView(viewModel: CheckoutViewModel(order: viewModel.order))
                }
            }
            .disabled(viewModel.isFieldsEmpty())
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(viewModel: AddressViewModel(order: Order()))
        }
    }
}
