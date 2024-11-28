//
//  StringExtension.swift
//  News read
//
//  Created by Hiren Joshi on 28/11/24.
//

import Foundation

func containsHTML(_ text: String) -> Bool {
    // First check: Regex for HTML tags
        let htmlRegex = "<(\"[^\"]*\"|'[^']*'|[^'\">])*>" // HTML tag regex
        let range = NSRange(location: 0, length: text.utf16.count)
        let regex = try? NSRegularExpression(pattern: htmlRegex)
        let regexMatch = regex?.firstMatch(in: text, options: [], range: range) != nil

        // Second check: Attempt parsing as HTML
        guard let data = text.data(using: .utf8) else { return false }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        let canParseHTML: Bool
        do {
            _ = try NSAttributedString(data: data, options: options, documentAttributes: nil)
            canParseHTML = true
        } catch {
            canParseHTML = false
        }

        // Combine the results: Both checks must pass
        return regexMatch && canParseHTML
}

