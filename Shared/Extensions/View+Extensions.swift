//
//  View+Extensions.swift
//  Novflix
//
//  Created by Tai Phan Van on 31/07/2021.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
