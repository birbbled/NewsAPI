//
//  FetchData.swift
//  NewsAPI
//
//  Created by Emily Wang (student LM) on 12/12/24.
//

import Foundation

struct FetchData{
    var response: Response = Response()
    mutating func getData() async{
        let URLString = "https://newsapi.org/v2/everything?q=tesla&from=2024-12-10&language=en&sortBy=publishedAt&apiKey=d22a5eb270b7465590e51e0906f98c2c"
        
        guard let url = URL(string: URLString) else {return}
        
        let (data, _) = try! await URLSession.shared.data(from: url)
        response = try! JSONDecoder().decode(Response.self, from: data)
      
        let dataString = String(data: data, encoding: .utf8)
        print(dataString ?? " ")
    }
}

struct Response: Codable{
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article] = []
}

struct Article: Codable{
    var title: String?
    
}

extension Article: Identifiable{
    var id: String{title ?? " "}
}
