//
//  OrderView.swift
//  CupcakeCorner
//
//  Created by ebpearls on 28/12/2022.
//

import SwiftUI

struct OrderView: View {
    // MARK: properties
    @ObservedObject var viewModel: OrderViewModel
    
    // MARK: body
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $viewModel.order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cupcakes: \(viewModel.order.quantity)", value: $viewModel.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special request?", isOn: $viewModel.order.specialRequestEnabled.animation())
                    
                    if viewModel.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $viewModel.order.extraFrosting)
                        
                        Toggle("Add sprinkles", isOn: $viewModel.order.addSprinkles)
                    }
                } header: {
                    Text("Special Request")
                        .textCase(nil)
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: OrderViewModel())
    }
}
