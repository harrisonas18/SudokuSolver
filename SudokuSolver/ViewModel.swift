//
//  ViewModel.swift
//  SudokuSolver
//
//  Created by Harrison Senesac on 11/13/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var didSucceed = false
    @Published var didFail = false
    @Published var gridArray: [GridPosition] = Array(repeating: GridPosition(position: ""), count: 81)
    @Published var gridArrayStrings: [String] = Array(repeating: String(), count: 81)
    @Published var showingHowToView = false
    let columns = Array(repeating: GridItem(.adaptive(minimum: 35.0), spacing: 0), count: 9)
    
    func solveSudoku(grid: [String]) -> [String]? {
        //Call validateInput so we can be sure every square has a number between 1-9
        if !validateInput(grid: grid) {
            return nil
        }
        let solved = SudokuSolver()
        guard let grid = solved.solveSudokuBoard(gridArray: grid) else { return nil }
        return grid
    }

    func clearGrid(grid: [String]) -> [String] {
        return ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
    }
    
    func validateInput(grid: [String]) -> Bool {
        //Make sure every square has a number between 1-9 or "" empty string
        //Return true or false if input is formatted correctly
        for string in grid {
            switch string {
            case "", "1", "2", "3", "4", "5", "6", "7", "8", "9":
                continue
            default:
                return false
            }
        }
        return true
    }

}
