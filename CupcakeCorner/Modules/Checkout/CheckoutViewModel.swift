//
//  CheckoutViewModel.swift
//  CupcakeCorner
//
//  Created by ebpearls on 28/12/2022.
//

import Foundation
import SwiftUI

class CheckoutViewModel: BaseViewModel {
    // MARK: properties
    @ObservedObject var order: Order
    
    @Published var confirmationMessage = ""
    @Published var showingConfirmation = false
    
    // MARK: initialization
    init(order: Order) {
        self.order = order
    }
    
    // MARK: placeOrder
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        guard let url = URL(string: "https://reqres.in/api/cupcakes") else {
            print("Incorrect URL")
            return
        }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)

            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        } catch {
            print("Checkout failed.")
        }
    }
}
