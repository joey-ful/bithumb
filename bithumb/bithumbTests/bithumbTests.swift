//
//  bithumbTests.swift
//  bithumbTests
//
//  Created by 김준건 on 2022/01/06.
//

import XCTest
@testable import bithumb

class bithumbTests: XCTestCase {
    func test_Ticker파일을_parse메서드로디코딩한다() {
        //Given
        let testFileName = "Ticker"
        let testDataType = Ticker.self
        guard let testData = NSDataAsset(name: testFileName)?.data else {
            return XCTFail("\(testFileName)파일이 잘못되었습니다.")
        }
        let expectedValue = "0000"
        
        //When
        let parsedResult = testData.parse(to: testDataType)
        
        //Then
        switch parsedResult {
        case .success(let decodedData):
            print(decodedData.status)
            XCTAssertEqual(decodedData.status, expectedValue)
        case.failure(let error):
            print(error)
        default:
            XCTFail("디코딩에 실패했습니다.")
        }
        
    }
}
