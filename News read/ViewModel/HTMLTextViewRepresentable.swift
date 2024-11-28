//
//  HTMLTextViewRepresentable.swift
//  News read
//
//  Created by Hiren Joshi on 28/11/24.
//


import SwiftUI
import UIKit

struct HTMLTextViewRepresentable: UIViewRepresentable {
    let htmlString: String

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        if let data = htmlString.data(using: .utf8) {
            do {
                let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue
                ]
                let attributedString = try NSAttributedString(data: data, options: options, documentAttributes: nil)
                uiView.attributedText = attributedString
            } catch {
                print("Error parsing HTML: \(error)")
            }
        } else {
            uiView.text = "Failed to load HTML"
        }
    }
    
}
