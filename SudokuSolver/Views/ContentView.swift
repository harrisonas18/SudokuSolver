//
//  ContentView.swift
//  SudokuSolver
//
//  Created by Harrison Senesac on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var sudokuViewModel = ViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 20.0){
            Text("Sudoku Solver")
                .font(.system(size: 36))
                .fontWeight(.bold)
            LazyVGrid(columns: sudokuViewModel.columns, spacing: 0.0) {
                ForEach(0...80, id: \.self) { value in
                    TextField("", text: $sudokuViewModel.gridArrayStrings[value])
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40.0, maxHeight: .infinity)
                        .border(Color(UIColor(red: 182.0/255.0, green: 182.0/255.0, blue: 182.0/255.0, alpha: 1.0)))
                        .background(Color(UIColor(red: 246.0/255.0, green: 246.0/255.0, blue: 246.0/255.0, alpha: 1.0)))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .onTapGesture {
                            hideKeyboard()
                        }
                }
            }
            if sudokuViewModel.didSucceed {
                Text("Success")
                    .foregroundColor(.green)
            }
            if sudokuViewModel.didFail {
                Text("Error with input, check board & try again.")
                    .foregroundColor(.red)
            }
            Spacer()
            VStack(alignment: .center, spacing: 15.0){
                Spacer()
                Button {
                    sudokuViewModel.didFail = false
                    sudokuViewModel.didSucceed = false
                    if let gridArrayStrings = sudokuViewModel.solveSudoku(grid: sudokuViewModel.gridArrayStrings){
                        sudokuViewModel.gridArrayStrings = gridArrayStrings
                        sudokuViewModel.didSucceed = true
                    } else {
                        //Show Error Message to user
                        sudokuViewModel.didFail = true
                    }
                } label: {
                    Text("Solve")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(UIColor(red: 58.0/255.0, green: 99.0/255.0, blue: 205.0/255.0, alpha: 1.0)))
                        .cornerRadius(.infinity)
                }
                Button {
                    sudokuViewModel.gridArrayStrings = sudokuViewModel.clearGrid(grid: sudokuViewModel.gridArrayStrings)
                    sudokuViewModel.didSucceed = false
                    sudokuViewModel.didFail = false
                } label: {
                    Text("Clear")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(UIColor(red: 194.0/255.0, green: 194.0/255.0, blue: 194.0/255.0, alpha: 1.0)))
                        .cornerRadius(.infinity)
                }
                Button {
                    sudokuViewModel.showingHowToView = true
                } label: {
                    Text("How To Use Sudoku Solver")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                }
                .popover(isPresented: $sudokuViewModel.showingHowToView){
                    HowToUseView()
                }
            }
            Spacer()
        }
        .padding(10.0)
        .ignoresSafeArea(.keyboard)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
