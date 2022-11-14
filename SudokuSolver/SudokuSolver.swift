//
//  SudokuSolver.swift
//  SudokuSolver
//
//  Created by Harrison Senesac on 11/12/22.
//

import Foundation

class SudokuSolver {
    
    func solveSudokuBoard(gridArray: [String]) -> [String]? {
        var matrix = convert1DTo2D(gridArray: gridArray)
        guard let matrix = solveSudoku(&matrix) else { return nil } 
        return convert2DTo1D(matrix: matrix)
    }
    
    func solveSudoku(_ board: inout [[String]]) -> [[String]]? {
        guard board.count != 0 || board[0].count != 0 else { return nil}
        
        //Make own validator to check board before solving it
        //Loop through row, column ignoring "" empty string only check if it has a number in it.
        for r in 0..<board.count {
            for c in 0..<board[0].count {
                if board[r][c] != "" {
                    if isValidBoard(board, String("\(board[r][c])"), r, c) {
                        continue
                    } else {
                        return nil
                    }
                } else {
                    //String is equal to empty string ""
                    continue
                }
            }
        }
        
        
        if helper(&board) {
            return board
        } else {
            return nil
        }
        
    }
    
    private func helper(_ board: inout [[String]]) -> Bool {
        for r in 0..<board.count {
            for c in 0..<board[0].count where board[r][c] == "" {
                for n in 1...9 where isValid(board, String("\(n)"), r, c) {
                    board[r][c] = String("\(n)")
                    if helper(&board) {
                        //return completed board
                        return true
                    } else {
                        board[r][c] = ""
                    }
                }
                return false
            }
        }
        return true
    }
    
    //&& != ""
    private func isValid(_ board: [[String]], _ string: String, _ r: Int,  _ c: Int) -> Bool {
        for i in 0...8 {
            if board[r][i] == string || board[i][c] == string {
                return false
            }
            if board[(r / 3) * 3 + i / 3][(c / 3) * 3 + i % 3] == string {
                return false
            }
        }
        return true
    }
    
    private func isValidBoard(_ board: [[String]], _ string: String, _ r: Int,  _ c: Int) -> Bool {
        var charCount = 0
        for i in 0...8 {
            if board[r][i] == string || board [i][c] == string {
                charCount += 1
            }
            if board[(r / 3) * 3 + i / 3][(c / 3) * 3 + i % 3] == string {
                charCount += 1
            }
        }
        if charCount > 3 {
            return false
        } else {
            return true
        }
    }
    
    
    func convert1DTo2D(gridArray: [String]) -> [[String]] {
        
        let matrix: [[String]] = [
            ["","","","","","","","",""],
            ["","","","","","","","",""],
            ["","","","","","","","",""],
            ["","","","","","","","",""],
            ["","","","","","","","",""],
            ["","","","","","","","",""],
            ["","","","","","","","",""],
            ["","","","","","","","",""],
            ["","","","","","","","",""],
        ]
        
        var iter = gridArray.makeIterator()
        let newArray = matrix.map { $0.compactMap { _ in iter.next() } }
        
        return newArray
    }
    
    func convert2DTo1D(matrix: [[String]]) -> [String] {
        let reduced = matrix.reduce([], +)
        return reduced
    }
    
}
