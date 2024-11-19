//
<<<<<<<< HEAD:popgraphUITests/popgraphUITestsLaunchTests.swift
//  popgraphUITestsLaunchTests.swift
//  popgraphUITests
//
//  Created by Rodney Dyer on 11/19/24.
========
//  Population_GraphsUITestsLaunchTests.swift
//  Population GraphsUITests
//
//  Created by Rodney Dyer on 3/15/24.
>>>>>>>> c4cf66c925c0b8b7e5c2f1f4993b42dbe93dc927:Population GraphsUITests/Population_GraphsUITestsLaunchTests.swift
//

import XCTest

<<<<<<<< HEAD:popgraphUITests/popgraphUITestsLaunchTests.swift
final class popgraphUITestsLaunchTests: XCTestCase {
========
/*
final class Population_GraphsUITestsLaunchTests: XCTestCase {
>>>>>>>> c4cf66c925c0b8b7e5c2f1f4993b42dbe93dc927:Population GraphsUITests/Population_GraphsUITestsLaunchTests.swift

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
