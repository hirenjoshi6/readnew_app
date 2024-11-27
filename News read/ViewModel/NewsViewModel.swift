//
//  NewsViewModel.swift
//  News read
//
//  Created by Hiren Joshi on 23/11/24.
//


import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles: [NewsArticle] = []

    func fetchdummyNews() {
        articles.append(NewsArticle(source: nil, author: "Punjabi Grill Chaap", title: "Afghani Chaap", description: "Pure Veg • North Indian • ₹200 for one", url: "", urlToImage: "https://via.placeholder.com/80", publishedAt: "38 mins • 1 km • Free Delivery", content: ""))
        articles.append(NewsArticle(source: nil, author: "Punjabi Grill Chaap", title: "Afghani Chaap", description: "Pure Veg • North Indian • ₹200 for one", url: "", urlToImage: "https://via.placeholder.com/80", publishedAt: "38 mins • 1 km • Free Delivery", content: ""))
    }
    
    func fetchNews() {
        APIService.shared.fetchArticles() { articles in
            DispatchQueue.main.async {
                self.articles = articles ?? []
            }
        }
    }
    
    func toggleBookmark(for article: NewsArticle) {
        if let index = articles.firstIndex(where: { $0.id == article.id }) {
            articles[index].isBookmarked.toggle()
        }
    }
}
