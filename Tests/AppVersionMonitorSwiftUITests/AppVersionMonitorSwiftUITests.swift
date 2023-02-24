//
//  AppVersionMonitorSwiftUITests.swift
//
//
//  Created by TAISHIN MIYAMOTO on 2023/02/24
//
//

import XCTest
@testable import AppVersionMonitorSwiftUI

final class AppVersionMonitorSwiftUITests: XCTestCase {
    // MARK: All versions are 1 digit

    func testUpdateUnavailableEqualVersions() async throws {
        let currentVersion = "1.0.0"
        let itunesVersion = "1.0.0"

        let apiClientMock = APIClientMock(itunes: .init(results: [.init(version: itunesVersion)]))
        let currentVersionMock = CurrentVersionMock(version: currentVersion)
        let appVersionMonitorStatus = await AppVersionMonitorSwiftUI.appVersionMonitor(apiClient: apiClientMock, currentVersion: currentVersionMock, id: 12345)

        XCTAssertEqual(appVersionMonitorStatus, .updateUnavailable)
    }

    func testUpdateUnavailableCurrentVersionGreater() async throws {
        let currentVersion = "1.1.0"
        let itunesVersion = "1.0.0"

        let apiClientMock = APIClientMock(itunes: .init(results: [.init(version: itunesVersion)]))
        let currentVersionMock = CurrentVersionMock(version: currentVersion)
        let appVersionMonitorStatus = await AppVersionMonitorSwiftUI.appVersionMonitor(apiClient: apiClientMock, currentVersion: currentVersionMock, id: 12345)

        XCTAssertEqual(appVersionMonitorStatus, .updateUnavailable)
    }

    func testUpdateAvailableCurrentVersionLess() async throws {
        let currentVersion = "1.0.0"
        let itunesVersion = "1.1.0"

        let apiClientMock = APIClientMock(itunes: .init(results: [.init(version: itunesVersion)]))
        let currentVersionMock = CurrentVersionMock(version: currentVersion)
        let appVersionMonitorStatus = await AppVersionMonitorSwiftUI.appVersionMonitor(apiClient: apiClientMock, currentVersion: currentVersionMock, id: 12345)

        XCTAssertEqual(appVersionMonitorStatus, .updateAvailable)
    }

    // MARK: Major version only 2 digits

    func testUpdateUnavailableEqualVersionsTwoDigitMajor() async throws {
        let currentVersion = "10.0.0"
        let itunesVersion = "10.0.0"

        let apiClientMock = APIClientMock(itunes: .init(results: [.init(version: itunesVersion)]))
        let currentVersionMock = CurrentVersionMock(version: currentVersion)
        let appVersionMonitorStatus = await AppVersionMonitorSwiftUI.appVersionMonitor(apiClient: apiClientMock, currentVersion: currentVersionMock, id: 12345)

        XCTAssertEqual(appVersionMonitorStatus, .updateUnavailable)
    }

    func testUpdateUnavailableCurrentVersionGreaterTwoDigitMajor() async throws {
        let currentVersion = "11.0.0"
        let itunesVersion = "10.0.0"

        let apiClientMock = APIClientMock(itunes: .init(results: [.init(version: itunesVersion)]))
        let currentVersionMock = CurrentVersionMock(version: currentVersion)
        let appVersionMonitorStatus = await AppVersionMonitorSwiftUI.appVersionMonitor(apiClient: apiClientMock, currentVersion: currentVersionMock, id: 12345)

        XCTAssertEqual(appVersionMonitorStatus, .updateUnavailable)
    }

    func testUpdateAvailableCurrentVersionLessTwoDigitMajor() async throws {
        let currentVersion = "10.0.0"
        let itunesVersion = "11.0.0"

        let apiClientMock = APIClientMock(itunes: .init(results: [.init(version: itunesVersion)]))
        let currentVersionMock = CurrentVersionMock(version: currentVersion)
        let appVersionMonitorStatus = await AppVersionMonitorSwiftUI.appVersionMonitor(apiClient: apiClientMock, currentVersion: currentVersionMock, id: 12345)

        XCTAssertEqual(appVersionMonitorStatus, .updateAvailable)
    }

    // MARK: MARK: Minor version only 2 digits

    func testUpdateUnavailableEqualVersionsTwoDigitMinor() async throws {
        let currentVersion = "1.10.0"
        let itunesVersion = "1.10.0"

        let apiClientMock = APIClientMock(itunes: .init(results: [.init(version: itunesVersion)]))
        let currentVersionMock = CurrentVersionMock(version: currentVersion)
        let appVersionMonitorStatus = await AppVersionMonitorSwiftUI.appVersionMonitor(apiClient: apiClientMock, currentVersion: currentVersionMock, id: 12345)

        XCTAssertEqual(appVersionMonitorStatus, .updateUnavailable)
    }

    func testUpdateUnavailableCurrentVersionGreaterTwoDigitMinor() async throws {
        let currentVersion = "1.11.0"
        let itunesVersion = "1.10.0"

        let apiClientMock = APIClientMock(itunes: .init(results: [.init(version: itunesVersion)]))
        let currentVersionMock = CurrentVersionMock(version: currentVersion)
        let appVersionMonitorStatus = await AppVersionMonitorSwiftUI.appVersionMonitor(apiClient: apiClientMock, currentVersion: currentVersionMock, id: 12345)

        XCTAssertEqual(appVersionMonitorStatus, .updateUnavailable)
    }

    func testUpdateAvailableCurrentVersionLessTwoDigitMinor() async throws {
        let currentVersion = "1.10.0"
        let itunesVersion = "1.11.0"

        let apiClientMock = APIClientMock(itunes: .init(results: [.init(version: itunesVersion)]))
        let currentVersionMock = CurrentVersionMock(version: currentVersion)
        let appVersionMonitorStatus = await AppVersionMonitorSwiftUI.appVersionMonitor(apiClient: apiClientMock, currentVersion: currentVersionMock, id: 12345)

        XCTAssertEqual(appVersionMonitorStatus, .updateAvailable)
    }

    // MARK: MARK: Patch version only 2 digits

    func testUpdateUnavailableEqualVersionsTwoDigitPatch() async throws {
        let currentVersion = "1.0.10"
        let itunesVersion = "1.0.10"

        let apiClientMock = APIClientMock(itunes: .init(results: [.init(version: itunesVersion)]))
        let currentVersionMock = CurrentVersionMock(version: currentVersion)
        let appVersionMonitorStatus = await AppVersionMonitorSwiftUI.appVersionMonitor(apiClient: apiClientMock, currentVersion: currentVersionMock, id: 12345)

        XCTAssertEqual(appVersionMonitorStatus, .updateUnavailable)
    }

    func testUpdateUnavailableCurrentVersionGreaterTwoDigitPatch() async throws {
        let currentVersion = "1.0.11"
        let itunesVersion = "1.0.10"

        let apiClientMock = APIClientMock(itunes: .init(results: [.init(version: itunesVersion)]))
        let currentVersionMock = CurrentVersionMock(version: currentVersion)
        let appVersionMonitorStatus = await AppVersionMonitorSwiftUI.appVersionMonitor(apiClient: apiClientMock, currentVersion: currentVersionMock, id: 12345)

        XCTAssertEqual(appVersionMonitorStatus, .updateUnavailable)
    }

    func testUpdateAvailableCurrentVersionLessTwoDigitPatch() async throws {
        let currentVersion = "1.0.10"
        let itunesVersion = "1.0.11"

        let apiClientMock = APIClientMock(itunes: .init(results: [.init(version: itunesVersion)]))
        let currentVersionMock = CurrentVersionMock(version: currentVersion)
        let appVersionMonitorStatus = await AppVersionMonitorSwiftUI.appVersionMonitor(apiClient: apiClientMock, currentVersion: currentVersionMock, id: 12345)

        XCTAssertEqual(appVersionMonitorStatus, .updateAvailable)
    }


    // MARK: Invalid VersionFormat

    func testAppVersionMonitorReturnsFailureWhenInvalidVersionFormat() async throws {
        let currentVersion = "1.0"
        let itunesVersion = "1.1"

        let apiClientMock = APIClientMock(itunes: .init(results: [.init(version: itunesVersion)]))
        let currentVersionMock = CurrentVersionMock(version: currentVersion)
        let appVersionMonitorStatus = await AppVersionMonitorSwiftUI.appVersionMonitor(apiClient: apiClientMock, currentVersion: currentVersionMock, id: 12345)

        XCTAssertEqual(appVersionMonitorStatus, .failure(AppVersionMonitorError.invalidVersionFormat))
    }
}
