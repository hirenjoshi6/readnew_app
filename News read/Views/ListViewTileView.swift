//
//  ListViewTile.swift
//  News read
//
//  Created by Hiren Joshi on 23/11/24.
//


import SwiftUI

struct ListViewTileView: View {
    
    var article: NewsArticle
    @EnvironmentObject var bookmarkManager: BookmarkManager

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 16) {
                // Image View
                if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .cornerRadius(8)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 80, height: 80)
                    }
                }
                
                // Text Content
                VStack(alignment: .leading, spacing: 8) {
                    Text(article.title!)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .lineLimit(4)
                }
                
                Spacer()
                
                // Bookmark Button
                Button(action: {
                    if bookmarkManager.bookmarks.contains(where: { $0.title?.uppercased() == article.title?.uppercased() }) {
                        bookmarkManager.removeBookmark(article: article)
                    } else {
                        bookmarkManager.addBookmark(article: article)
                    }
                }) {
                    Image(systemName: bookmarkManager.bookmarks.contains(where: { $0.title?.uppercased() == article.title?.uppercased() }) ? "bookmark.fill" : "bookmark")
                        .foregroundColor(.blue)
                        .padding(8)
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            HStack() {
                if let author = article.author {
                    Text("By \(author)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Text(article.publishedAt!)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            
            if let description = article.description {
                Text(description)
                    .font(.body)
                    .lineLimit(4)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        .padding(.horizontal)
    }
}
