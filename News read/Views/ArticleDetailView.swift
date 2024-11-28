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
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading) {
                    
                    if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                            //                                .aspectRatio(contentMode: .fill)
                                .scaledToFit() // Adjust to maintain the aspect ratio
                                .cornerRadius(8)
                                .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.4)
                                .frame(maxWidth: .infinity, alignment: .center) // Center horizontally
                        } placeholder: {
                            ProgressView()
                                .frame(width: 80, height: 80)
                        }
                    }
                    
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
                        
                        if containsHTML(description) {
                            HTMLTextViewRepresentable(htmlString: description)
                                .font(.body)
                                .lineLimit(4)
                                .foregroundColor(.gray)
                        } else {
                            Text(description)
                                .font(.body)
                                .lineLimit(4)
                                .foregroundColor(.gray)
                        }
                        
                    }
                    
                    if let content = article.content {
                        Divider()
                            .frame(height: 25) // Set height for a vertical divider
                        if containsHTML(content) {
                            HTMLTextViewRepresentable(htmlString: content)
                                .padding(.bottom)
                        } else {
                            Text(content)
                                .padding(.bottom)
                        }
                        
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
}

