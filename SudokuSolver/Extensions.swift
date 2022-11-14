//
//  Extensions.swift
//  SudokuSolver
//
//  Created by Harrison Senesac on 11/13/22.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
