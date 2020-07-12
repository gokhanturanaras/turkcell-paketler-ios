//
//  PaketlerTests.swift
//  PaketlerTests
//
//  Created by Gökhan on 10.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import XCTest
@testable import Paketler

class PaketlerTests: XCTestCase {
    
    private var viewModel: PackageListViewModel!
    let packageData = MockPackageData()
    
    override func setUp() {
        viewModel = PackageListViewModel(packageData: packageData)
    }
    
    func testLoad() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        viewModel.load()
        XCTAssertEqual(viewModel.items!.packages?.count, packageData.packageModel.packages?.count)
    }
    
    func testFilter() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var filterDataModels =  [FilterDataModel]()
        filterDataModels.append(FilterDataModel.init(cellType: CellType.CONTENT, title: "Test 1",idFilter: FilterIds.AYLIK.id, selected: true))
        viewModel.load()
        viewModel.showFilter(filterDataModel: filterDataModels)
        XCTAssertEqual(viewModel.items!.packages?.count, 2)
    }
    
    func testSort() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        viewModel.load()
        viewModel.showSort(idSort: 2)
        XCTAssertEqual(viewModel.items!.packages?[0].price,19.0)
        XCTAssertEqual(viewModel.items!.packages?[1].price,45.0)
        XCTAssertEqual(viewModel.items!.packages?[2].price,109.90)
        XCTAssertEqual(viewModel.items!.packages?[3].price,129.90)
        
    }
    
    func testDefaultSort() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        viewModel.load()
        viewModel.showSortDefault()
        XCTAssertTrue(((viewModel.items!.packages?[0].favorite) != nil))
        
    }
    
    func testDidSelectFavorite() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        viewModel.load()
        viewModel.didSelectFavorite(at: 1)
        XCTAssertTrue(((viewModel.items!.packages?[1].favorite) != nil))
        
    }
    
    
    func testDidInfoSelect() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        viewModel.load()
        viewModel.didInfoSelect(at: 3)
        XCTAssertTrue(((viewModel.items!.packages?[3].info) != nil))
        
    }
    
    
    func testDidCancelInfo() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        viewModel.load()
        viewModel.didCancelInfo(at: 0)
        XCTAssertEqual(viewModel.items!.packages?[0].info!,false)
    }
    
    func testDidSearch() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        viewModel.load()
        viewModel.didSearch(query: "Akıllı Fatura 500 Dakika Paketi")
        XCTAssertEqual(viewModel.items!.packages?[0].name,"Akıllı Fatura 500 Dakika Paketi")
    }
    
    func testDidCancelSearch() throws {
          // This is an example of a functional test case.
          // Use XCTAssert and related functions to verify your tests produce the correct results.
          viewModel.load()
          viewModel.didSearch(query: "Akıllı Fatura 500 Dakika Paketi")
          viewModel.didCancelSearch()
          XCTAssertEqual(viewModel.items!.packages?[0].name!,"Platinum Maksi 6 GB")
      }
    
}
