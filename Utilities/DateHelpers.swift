import Foundation

public enum DateHelpers {
    public static func startOfDay(_ date: Date, calendar: Calendar = .current) -> Date {
        calendar.startOfDay(for: date)
    }

    public static func endOfDay(_ date: Date, calendar: Calendar = .current) -> Date {
        // 23:59:59 on the same day (safe enough for UI grouping).
        let start = calendar.startOfDay(for: date)
        return calendar.date(byAdding: DateComponents(day: 1, second: -1), to: start) ?? date
    }

    public static func daysFromNow(_ days: Int, calendar: Calendar = .current) -> Date {
        calendar.date(byAdding: .day, value: days, to: Date()) ?? Date()
    }

    public static func isWithinNextDays(_ date: Date, days: Int, calendar: Calendar = .current) -> Bool {
        let now = Date()
        let end = calendar.date(byAdding: .day, value: days, to: now) ?? now
        return date >= now && date <= end
    }
}
