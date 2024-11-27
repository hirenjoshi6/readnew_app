//
//  BookmarkManager.swift
//  News read
//
//  Created by Hiren Joshi on 23/11/24.
//


import Foundation

class BookmarkManager: ObservableObject {
    @Published var bookmarks: [NewsArticle] = []

    func addBookmark(article: NewsArticle) {
        bookmarks.append(article)
    }

    func removeBookmark(article: NewsArticle) {
        bookmarks.removeAll { $0.id == article.id }
    }
}