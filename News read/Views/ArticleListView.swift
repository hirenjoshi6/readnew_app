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

    var body: some View {
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

//#Preview {
//    ArticleListView()
//}
