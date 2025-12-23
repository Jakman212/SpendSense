import Foundation

public enum Money {
    /// Formats cents into a localized currency string, e.g. "$9.99".
    public static func format(cents: Int, locale: Locale = .current) -> String {
        let nf = NumberFormatter.currency(locale: locale)
        let dollars = Decimal(cents) / 100
        return nf.string(from: dollars as NSDecimalNumber) ?? "$0.00"
    }

    /// Best for editing fields (no currency symbol, stable 2 decimals).
    public static func formatForEditing(cents: Int) -> String {
        let dollars = Double(cents) / 100.0
        return String(format: "%.2f", dollars)
    }

    /// Parses user input like "9.99", "$9.99", "1,234.56" into cents.
    /// Returns nil if parsing fails.
    public static func parseToCents(_ input: String) -> Int? {
        let cleaned = sanitizeMoneyString(input)
        guard let value = Decimal(string: cleaned, locale: Locale(identifier: "en_US_POSIX")) else {
            return nil
        }
        // Round to nearest cent to be safe:
        let centsDecimal = (value * 100).rounded(0)
        let cents = NSDecimalNumber(decimal: centsDecimal).intValue
        return max(0, cents)
    }

    private static func sanitizeMoneyString(_ s: String) -> String {
        // Keep digits + dot, remove commas, currency symbols, spaces.
        // Also allow a leading "-" but we'll clamp later.
        let trimmed = s.trimmingCharacters(in: .whitespacesAndNewlines)
        var result = ""
        for (i, ch) in trimmed.enumerated() {
            if ch.isNumber { result.append(ch); continue }
            if ch == "." { result.append(ch); continue }
            if ch == "-" && i == 0 { result.append(ch); continue }
            // ignore everything else
        }
        return result
    }
}

private extension Decimal {
    func rounded(_ scale: Int, mode: NSDecimalNumber.RoundingMode = .bankers) -> Decimal {
        var value = self
        var result = Decimal()
        NSDecimalRound(&result, &value, scale, mode)
        return result
    }
}

private extension NumberFormatter {
    static func currency(locale: Locale) -> NumberFormatter {
        let nf = NumberFormatter()
        nf.locale = locale
        nf.numberStyle = .currency
        nf.maximumFractionDigits = 2
        nf.minimumFractionDigits = 2
        return nf
    }
}
