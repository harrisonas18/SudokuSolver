//
//  HowToUseView.swift
//  SudokuSolver
//
//  Created by Harrison Senesac on 11/16/22.
//

import Foundation
import SwiftUI


struct HowToUseView: View {
    
    var body: some View {
        VStack {
            Text("How To Use 2022 Sudoku Solver")
                .padding(EdgeInsets(top: 20.0, leading: 0, bottom: 0, trailing: 0))
                .font(.system(size: 24))
                .fontWeight(.bold)
            Text("1. Copy in your unsolved Sudoku board. Making sure you only enter numbers 1-9, leaving all other board spaces blank.\n\n2. Press Solve and the app will fill out the rest of the board for you. \n\n3. If the board was filled out correctly the app will respond with a success ✅ message. If the board was filled out incorrectly then it will respond with an error ❌.")
                .padding(EdgeInsets(top: 20.0, leading: 0, bottom: 0, trailing: 0))
                .font(.system(size: 26))
                .fontWeight(.medium)
            Spacer()
            
        }
        .padding(15.0)
    }
    
}

struct HowToUseView_Previews: PreviewProvider {
    static var previews: some View {
        HowToUseView()
    }
}

struct Previews_HowToUseView_Previews: PreviewProvider {
    static var previews: some View {
        HowToUseView()
    }
}
