//
//  ArticleDetailView.swift
//  News read
//
//  Created by Hiren Joshi on 23/11/24.
//


import SwiftUI

struct ArticleDetailView: View {
    let article: NewsArticle

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(article.title!)
                    .font(.largeTitle)
                    .padding(.bottom)
                
                Divider()
                        .frame(height: 25) // Set height for a vertical divider
                
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
                    Divider()
                            .frame(height: 25) // Set height for a vertical divider
                    
                    Text(description)
                        .font(.body)
                        .lineLimit(4)
                        .foregroundColor(.gray)
                }

                if let content = article.content {
                    Divider()
                            .frame(height: 25) // Set height for a vertical divider
                    
                    Text(content)
                        .padding(.bottom)
                }
                
                if let url = URL(string: article.url!) {
                    Link("Read Full Article", destination: url)
                        .padding()
                        .foregroundColor(.blue)
                }
            }
            .padding()
        }
        .navigationTitle("Article Detail")
    }
}