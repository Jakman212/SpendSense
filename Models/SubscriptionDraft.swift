import Foundation

/// A platform-agnostic type you can use in forms, validation, CSV export, previews, etc.
/// Later your SwiftData `Subscription` can map to/from this.
public struct SubscriptionDraft: Equatable, Codable {
    public var id: UUID
    public var name: String
    public var vendor: String?
    public var category: String
    public var notes: String?

    public var costCents: Int
    public var cycleUnit: BillingUnit
    public var cycleCount: Int
    public var nextRenewalDate: Date
    public var isActive: Bool

    public var createdAt: Date
    public var updatedAt: Date

    public init(
        id: UUID = UUID(),
        name: String = "",
        vendor: String? = nil,
        category: String = "Uncategorized",
        notes: String? = nil,
        costCents: Int = 0,
        cycleUnit: BillingUnit = .month,
        cycleCount: Int = 1,
        nextRenewalDate: Date = .now,
        isActive: Bool = true,
        createdAt: Date = .now,
        updatedAt: Date = .now
    ) {
        self.id = id
        self.name = name
        self.vendor = vendor
        self.category = category
        self.notes = notes
        self.costCents = max(0, costCents)
        self.cycleUnit = cycleUnit
        self.cycleCount = max(1, cycleCount)
        self.nextRenewalDate = nextRenewalDate
        self.isActive = isActive
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
