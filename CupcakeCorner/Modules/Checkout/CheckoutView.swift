//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by ebpearls on 28/12/2022.
//

import SwiftUI

struct CheckoutView: View {
    // MARK: properties
    @ObservedObject var viewModel: CheckoutViewModel
    
    // MARK: body
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total cost is \(viewModel.order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place order", action: {
                    Task {
                        await viewModel.placeOrder()
                    }
                })
                .padding()
            }
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank You!", isPresented: $viewModel.showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(viewModel.confirmationMessage)
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView(viewModel: CheckoutViewModel(order: Order()))
        }
    }
}
