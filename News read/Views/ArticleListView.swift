//
//  ArticleListView.swift
//  News read
//
//  Created by Hiren Joshi on 23/11/24.
//


import SwiftUI

struct ArticleListView: View {
    @StateObject var viewModel = NewsViewModel()
    @EnvironmentObject var bookmarkManager: BookmarkManager
    @State private var isLoading: Bool = true

    var body: some View {
        
        ZStack {
            if isLoading && viewModel.articles.isEmpty {
                // Loading indicator
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5)
                    .foregroundColor(.blue)
            } else if viewModel.articles.isEmpty {
                // No data found screen
                NoDataView()
            } else {
                NavigationView {
                    List(viewModel.articles) { article in
                        NavigationLink(destination: ArticleDetailView(article: article)) {
                            ListViewTileView(article: article)
                            .padding(-10)
                            .padding(.vertical)
                            .listRowSeparator(.hidden)
                            .background(Color.clear) // Ensure the row background is
                            .listRowInsets(EdgeInsets())
                        }
                        .isDetailLink(false)
                    }
                    .listStyle(PlainListStyle())
                    .background(Color.clear)
                    .navigationTitle("News Articles")
                    .background(Color(UIColor(Color.clear)))
                    .onAppear {
                        viewModel.fetchNews()
                    }
                }
                .background(Color(UIColor.systemPink))
            }
        }
        .onAppear {
            DispatchQueue.main.async {
                viewModel.fetchNews()
                isLoading = viewModel.articles.isEmpty ? true : false
            }
        }
        .animation(.easeInOut, value: isLoading || viewModel.articles.isEmpty)
    }
}

//#Preview {
//    ArticleListView()
//}
