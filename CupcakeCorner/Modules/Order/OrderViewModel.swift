//
//  OrderViewModel.swift
//  CupcakeCorner
//
//  Created by ebpearls on 28/12/2022.
//

import Foundation
import SwiftUI

class OrderViewModel: BaseViewModel {
    // MARK: properties
    @Published var order = Order() /// creates only once then other views will observe only, sharing same data all over the app
}
