//
//  CupcakeCornerApp.swift
//  CupcakeCorner
//
//  Created by ebpearls on 27/12/2022.
//

import SwiftUI

@main
struct CupcakeCornerApp: App {
    var body: some Scene {
        WindowGroup {
            OrderView(viewModel: OrderViewModel())
        }
    }
}
