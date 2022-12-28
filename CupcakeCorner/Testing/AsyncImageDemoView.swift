//
//  AsyncImageDemoView.swift
//  CupcakeCorner
//
//  Created by ebpearls on 27/12/2022.
//

import SwiftUI

struct AsyncImageDemoView: View {
    var showBadURL: Bool = true 
    
    var urlString: String {
        get {
            showBadURL ? "https://hws.dev/img/bad.png" : "https://hws.dev/img/logo.png"
        }
    }
    
    var body: some View {
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"))
//            .frame(width: 200, height: 200)
        
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
//            image
//                .resizable()
//                .scaledToFit()
//        } placeholder: {
////            Color.red
//            ProgressView()
//        }
//        .frame(width: 200, height: 200)
        
        AsyncImage(url: URL(string: urlString)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("Error loading image")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

struct AsyncImageDemoView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageDemoView()
    }
}
