//
//  ContentView.swift
//  NewsAPI
//
//  Created by Emily Wang (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var json = "Loading..."
    
    var body: some View {
        VStack {
            Text(json)
        }
        .task{
           func loadData() async {

               let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2024-11-10&sortBy=publishedAt&apiKey=d22a5eb270b7465590e51e0906f98c2c")!

               let (data, _) = try! await URLSession.shared.data(from: url)

               json = (String(decoding: data, as: UTF8.self))
           }

           await loadData()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
