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
        mainVM.getCVHeaders(fromJsonData: nil) { (headers, error) in
            if let error = error {
                XCTAssertEqual(error, CVDataParserError.MissingJsonData)
            }
        }
    }
    
    func testParsingFailed()
    {
        let jsonString = """
        {
            "invalid1": "invalid 1",
            "invalid2": "invalid 2",
            "invalid3": "invalid 3"
        }
        """
        
        guard let jsonData = jsonString.data(using: .utf8) else {
            return
        }
    
        let mainVM = MainViewModel()
        mainVM.getCVHeaders(fromJsonData: jsonData) { (headers, error) in
            if let error = error {
                XCTAssertEqual(error, CVDataParserError.ParsingFailed)
            }
        }
    }
    
    func testParsingSuccessful() {
        
        let jsonString = """
            {
                "headers": [
                    "Experience",
                    "Education",
                    "Skills",
                    "Language",
                    "References"
                ],
                "basicInformation": {
                    "name": "Jerry Alvarez",
                    "address": "94391 Karianne Passage Detroit MI",
                    "phone": "+1 (555) 529 5878",
                    "summary": "Skilled and efficient iOS Developer with 3 years of experience creating unique and modern applications available in the App Store."
                },
                "experience": [
                    {
                        "position": "Senior iOS Developer",
                        "companyName": "Audible",
                        "location": "Newark, NJ",
                        "startDate": "10/2016",
                        "endDate": "present",
                        "responsibilities": [
                            "Work with the Manager of Mobile Development to provide estimates and status updates",
                            "Work with other developers, designers and product/business managers to develop new features consistent with product roadmap",
                            "Passion for iOS development, you love to develop and stay up to date with latest developments in and around iOS",
                            "Designs, develops, manages, creates and maintains technical components and templates",
                            "Provide technical leadership and take ownership for the technical development project/program delivery of component design, development and maintenance",
                            "Work to create new applications and to expand/improve on an ongoing basis by adding new functionality and resolving existing issues",
                            "Work with the team to create new iOS apps built upon our common mobile framework"
                        ]
                    },
                    {
                        "position": "Lead iOS Developer",
                        "companyName": "Facebook",
                        "location": "Boston, MA",
                        "startDate": "05/2010",
                        "endDate": "06/2016",
                        "responsibilities": [
                            "Hands on software development: being assigned specific tasks that can be developed and produced within designated time interval (sprint)",
                            "Develop applications using Objective C, XCode, Interface Builder, Instruments, Cocoa Touch, and other iOS development tools",
                            "Collaborate as a member of an agile team to get products developed and completed with best in class software development",
                            "Worked with a team that developed and distributed an iOS App on the App Store",
                            "Provide insight to the team as to best software application development practices and techniques",
                            "Deliver Projects with High Quality and High Performance",
                            "General knowledge of other related disciplines. Provide technical solutions to a wide range of difficult problems"
                        ]
                    },
                    {
                        "position": "iOS Developer",
                        "companyName": "Alphine Building Maintenance",
                        "location": "Delta, BC",
                        "startDate": "06/2007",
                        "endDate": "03/2010",
                        "responsibilities": [
                            "Assists the lead developer and or developers in analysis, design, development, and performance optimization of web application",
                            "Partner closely with product management, QA and your development team members to continously improve our app",
                            "Eager to get nerdy about memory management, UI layout and rendering, or network performance",
                            "Act as technical lead on projects, assist with defining the solution, and working with a team of developers"
                        ]
                    }
                ],
                "education": [
                    {
                        "school": "Harvard University",
                        "degree": "MS in Machine Learning",
                        "yearGraduated": "2008"
                    },
                    {
                        "school": "Stanford University",
                        "degree": "MS in Computer Programming",
                        "yearGraduated": "2007"
                    },
                    {
                        "school": "University of British Columbia",
                        "degree": "Bachelor’s Degree in Computer Science",
                        "yearGraduated": "2005"
                    },
                    {
                        "school": "British Columbia Institute of Technology",
                        "degree": "Bachelor’s Degree in Computer Science",
                        "yearGraduated": "2002"
                    }
                ],
                "skills": [
                    "Software Development",
                    "Mobile App Development",
                    "Web Development",
                    "Game Design and Development",
                    "3D modelling",
                    "Graphics Design",
                    "Xcode",
                    "Swift",
                    "Objective-C",
                    "Javascript"
                ],
                "language": [
                    "English",
                    "French",
                    "Filipino",
                    "Japanese"
                ],
                "references": [
                    {
                        "name": "Michael Woods",
                        "company": "Atimi Software",
                        "position": "Vice President of Software Development",
                        "phone": "778-995-8592"
                    },
                    {
                        "name": "Terrence Geernaert",
                        "company": "Atimi Software",
                        "position": "Executive Vice President of Software Development",
                        "phone": "778-372-2806"
                    },
                    {
                        "name": "Paul Fieber",
                        "company": "Atimi Software",
                        "position": "IT Director",
                        "phone": "778-229-0023"
                    }
                ]
            }
            """
            
            guard let jsonData = jsonString.data(using: .utf8) else {
                return
            }
        
            let mainVM = MainViewModel()
            mainVM.getCVHeaders(fromJsonData: jsonData) { (headers, error) in
                XCTAssertNil(error)
                XCTAssertNotNil(headers)
                XCTAssertNotNil(mainVM.cv)
                XCTAssertEqual(mainVM.cv?.basicInformation?.name, "Jerry Alvarez")
            }
    }
}
