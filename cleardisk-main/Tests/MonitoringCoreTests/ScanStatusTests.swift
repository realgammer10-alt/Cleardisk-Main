import XCTest
@testable import MonitoringCore

final class ScanStatusTests: XCTestCase {
    func testUnstartedMonitorIsNotStarted() {
        XCTAssertEqual(
            ScanStatus.resolve(isScanning: false, hasCompletedFirstScan: false, hasIssues: false),
            .notStarted
        )
    }

    func testActiveScanTakesPrecedenceOverPreviousIssues() {
        XCTAssertEqual(
            ScanStatus.resolve(isScanning: true, hasCompletedFirstScan: true, hasIssues: true),
            .scanning
        )
    }

    func testCompletedScanWithoutIssuesIsHealthy() {
        XCTAssertEqual(
            ScanStatus.resolve(isScanning: false, hasCompletedFirstScan: true, hasIssues: false),
            .healthy
        )
    }

    func testCompletedScanWithIssuesIsDegraded() {
        XCTAssertEqual(
            ScanStatus.resolve(isScanning: false, hasCompletedFirstScan: true, hasIssues: true),
            .degraded
        )
    }
}
