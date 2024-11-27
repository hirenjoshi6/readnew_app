//
//  News_readApp.swift
//  News read
//
//  Created by Hiren Joshi on 23/11/24.
//

import SwiftUI

@main
struct News_readApp: App {
    
    @StateObject private var bookmarkManager = BookmarkManager()

        var body: some Scene {
            WindowGroup {
                ArticleListView()
                    .environmentObject(bookmarkManager)
            }
        }
    
}
