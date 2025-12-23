import Foundation

public protocol SubscriptionLike {
    var costCents: Int { get }
    var cycleUnit: BillingUnit { get }
    var cycleCount: Int { get }
    var isActive: Bool { get }
}

extension SubscriptionDraft: SubscriptionLike {}

public enum SpendMath {
    /// Annualized cost in cents (e.g., $10 monthly => $120/yr).
    public static func annualizedCents<T: SubscriptionLike>(for sub: T) -> Int {
        guard sub.isActive else { return 0 }
        let cost = max(0, sub.costCents)
        let n = max(1, sub.cycleCount)

        switch sub.cycleUnit {
        case .month:
            // cost every N months -> 12/N times per year
            return Int(Double(cost) * (12.0 / Double(n)))
        case .year:
            // cost every N years -> 1/N times per year
            return Int(Double(cost) * (1.0 / Double(n)))
        }
    }

    /// Monthly equivalent in cents (annualized / 12).
    public static func monthlyEquivalentCents<T: SubscriptionLike>(for sub: T) -> Int {
        annualizedCents(for: sub) / 12
    }
}
