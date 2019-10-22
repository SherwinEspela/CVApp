//
//  CVAppTests.swift
//  CVAppTests
//
//  Created by Sherwin Espela on 2019-10-16.
//  Copyright © 2019 cybermash. All rights reserved.
//

import XCTest
@testable import CVApp

class CVAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMissingJsonData()
    {
        let mainVM = MainViewModel()
        mainVM.getCVData(withJsonDataFileName: "file_missing") { (cv, error) in
            if let error = error {
                XCTAssertEqual(error, CVDataParserError.MissingJsonFile)
            }
        }
    }
    
    func testParsingFailed()
    {
        let mainVM = MainViewModel()
        mainVM.getCVData(withJsonDataFileName: "invalid_data") { (cv, error) in
            if let error = error {
                XCTAssertEqual(error, CVDataParserError.ParsingFailed)
            }
        }
    }
    
    func testParsingSuccessful() {
        let mainVM = MainViewModel()
        mainVM.getCVData(withJsonDataFileName: "cv_data") { (cv, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(cv)
            XCTAssertNotNil(cv?.headers)
            XCTAssertEqual(cv?.basicInformation?.name, "Jerry Alvarez")
            XCTAssertEqual(cv?.basicInformation?.phone, "+1 (555) 527 5879")
        }
    }
}
