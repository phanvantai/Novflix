//
//  SearchBar.swift
//  Novflix
//
//  Created by Tai Phan Van on 31/07/2021.
//

import SwiftUI

struct SearchBar: View {
    
    @State private var text: String = ""
    @State private var isEditing: Bool = false
    @State private var isLoading: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.graySearchBackground
                .frame(width: 290, height: 36)
                .cornerRadius(8)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.graySearchText)
                    .padding(.leading, 10)
                
                TextField("Search", text: $text)
                    .padding(.vertical, 7)
                    .background(Color.graySearchBackground)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .onTapGesture(perform: {
                        isEditing = true
                    })
                
                if isLoading {
                    Button(action: {
                        text = ""
                    }, label: {
                        ActivityIndicator(style: .medium, animate: .constant(true))
                            .configure {
                                $0.color = .white
                            }
                            .frame(width: 35, height: 35)
                    })
                    .padding(.trailing, 10)
                } else {
                    Button(action: {
                        text = ""
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color.graySearchText)
                            .frame(width: 35, height: 35)
                    })
                    .padding(.trailing, 10)
                }
                
                if isEditing {
                    Button(action: {
                        // clear text, hide both button, resign first-reponder
                        text = ""
                        isEditing = false
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(Color.graySearchText)
                    })
                }
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            SearchBar()
                .padding()
        }
    }
}
