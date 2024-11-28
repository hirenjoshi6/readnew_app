//
//  NoDataView.swift
//  News read
//
//  Created by Hiren Joshi on 28/11/24.
//

import SwiftUI


struct NoDataView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "tray")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
            
            Text("No Data Available")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.bottom, 8)
            
            Text("It looks like there’s nothing here yet or your API key has been expired.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
        }
        .padding()
    }
    
    
}
