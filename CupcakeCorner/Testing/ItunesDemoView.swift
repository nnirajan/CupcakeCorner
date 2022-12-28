//
//  ItunesDemoView.swift
//  CupcakeCorner
//
//  Created by ebpearls on 27/12/2022.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ItunesDemoView: View {
    @State private var results = [Result]()
    
    var body: some View {
        NavigationView {
            List(results, id: \.trackId) { item in
                VStack(alignment: .leading) {
                    Text(item.trackName)
                        .font(.headline)
                    
                    Text(item.collectionName)
                }
            }
            .task {
                await loadData()
            }
            .navigationTitle("Taylor Swift Songs")
            .listStyle(.plain)
        }
    }
    
    private func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(Response.self, from: data)
            results = decoded.results
        } catch {
            print("error: \(error)")
        }
    }
}

struct ItunesDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ItunesDemoView()
    }
}
