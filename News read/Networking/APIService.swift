//
//  APIService.swift
//  News read
//
//  Created by Hiren Joshi on 23/11/24.
//


import Foundation

class APIService {
    
    static let shared = APIService()
    private let apiKey = "395613b97e4145f58664b501a7fb4cd7"
    private let baseURL = "https://newsapi.org/v2/everything?q=tesla&from=2024-10-28&sortBy=publishedAt"
    
    func fetchArticles(completion: @escaping ([NewsArticle]?) -> Void) {
        let urlString = "\(baseURL)&apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let articlesobj = try decoder.decode(NewsArticleData.self, from: data)
                    print("Data fetch: \(articlesobj.totalResults)")
                    completion(articlesobj.articles)
                } catch {
                    print("Error decoding data: \(error)")
                    completion(nil)
                }
            }
        }.resume()
    }
}
