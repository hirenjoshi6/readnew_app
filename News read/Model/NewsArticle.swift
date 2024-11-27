//
//  NewsArticle.swift
//  News read
//
//  Created by Hiren Joshi on 23/11/24.
//

//
//import Foundation
//
//struct NewsArticle: Codable, Identifiable {
//    let id = UUID()
//    let title: String
//    let description: String?
//    let url: String
//    let urlToImage: String?
//    let content: String?
//    let category: String
//
//    enum CodingKeys: String, CodingKey {
//        case title, description, url, urlToImage, content, category
//    }
//}

import Foundation

// MARK: - Welcome
struct NewsArticleData: Codable {
    let status: String
    let totalResults: Double
    let articles: [NewsArticle]
}

// MARK: - Article
struct NewsArticle: Codable, Identifiable {
    var id = UUID()
    let source: Source?
    let author, title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    var isBookmarked: Bool = false
    
    
    enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
//    let id: String
    let name: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}

