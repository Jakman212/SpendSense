import Foundation

public enum BillingUnit: String, Codable, CaseIterable, Identifiable {
    case month
    case year

    public var id: String { rawValue }
}
