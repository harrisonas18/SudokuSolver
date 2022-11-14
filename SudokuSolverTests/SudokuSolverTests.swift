//
//  SudokuSolverTests.swift
//  SudokuSolverTests
//
//  Created by Harrison Senesac on 11/14/22.
//

import XCTest
@testable import SudokuSolver

final class SudokuSolverTests: XCTestCase {

    var viewModel = ViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testSudokuSolverValidInput() throws {

        let solvedBoard = viewModel.solveSudoku(grid: ["5","3","","","7","","","","","6","","","1","9","5","","","","","9","8","","","","","6","","8","","","","6","","","","3","4","","","8","","3","","","1","7","","","","2","","","","6","","6","","","","","2","8","","","","","4","1","9","","","5","","","","","8","","","7","9"])

        XCTAssertEqual(solvedBoard, ["5","3","4","6","7","8","9","1","2","6","7","2","1","9","5","3","4","8","1","9","8","3","4","2","5","6","7","8","5","9","7","6","1","4","2","3","4","2","6","8","5","3","7","9","1","7","1","3","9","2","4","8","5","6","9","6","1","5","3","7","2","8","4","2","8","7","4","1","9","6","3","5","3","4","5","2","8","6","1","7","9"])
    }

    func testSudokuSolverInvalidInput() throws {

        let solvedBoard = viewModel.solveSudoku(grid: ["5","5","","","7","","","","","6","","","1","9","5","","","","","9","8","","","","","6","","8","","","","6","","","","3","4","","","8","","3","","","1","7","","","","2","","","","6","","6","","","","","2","8","","","","","4","1","9","","","5","","","","","8","","","7","9"])

        XCTAssertNil(solvedBoard)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
