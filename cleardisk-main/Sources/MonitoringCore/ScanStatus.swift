public enum ScanStatus: Equatable {
    case notStarted
    case scanning
    case healthy
    case degraded

    public static func resolve(
        isScanning: Bool,
        hasCompletedFirstScan: Bool,
        hasIssues: Bool
    ) -> ScanStatus {
        if isScanning {
            return .scanning
        }
        guard hasCompletedFirstScan else {
            return .notStarted
        }
        return hasIssues ? .degraded : .healthy
    }
}
