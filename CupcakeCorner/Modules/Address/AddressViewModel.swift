//
//  AddressViewModel.swift
//  CupcakeCorner
//
//  Created by ebpearls on 28/12/2022.
//

import Foundation
import SwiftUI

class AddressViewModel: BaseViewModel {
    // MARK: properties
    @Published var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    // MARK: validateForm
    /// checks if the fields are empty
    /// - Returns: true -> empty fields / false -> not empty fields
    func isFieldsEmpty() -> Bool {
        let nameIsEmpty = order.name.isEmpty
        let streetAddressIsEmpty = order.streetAddress.isEmpty
        let cityIsEmpty = order.city.isEmpty
        let zipIsEmpty = order.zip.isEmpty
        
        return nameIsEmpty || streetAddressIsEmpty || cityIsEmpty || zipIsEmpty
    }
}
