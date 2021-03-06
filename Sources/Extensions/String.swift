import Foundation

public extension String {

    /// Returns the receiver casted to an `NSString`
    var nsString: NSString {
        return self as NSString
    }

    /// Returns a string object containing the characters of the receiver that lie within a given range.
    ///
    /// - Parameter nsRange: A range. The range must not exceed the bounds of the receiver.
    /// - Returns: A string object containing the characters of the receiver that lie within aRange.
    func substring(with nsRange: NSRange) -> String {
        return nsString.substring(with: nsRange) as String
    }
}

public extension String {

    /// Attempts conversion of the receiver to a boolean value, according to the following rules:
    ///
    /// - true: `"true", "yes", "1"` (allowing case variations)
    /// - false: `"false", "no", "0"` (allowing case variations)
    ///
    /// If none of the following rules is verified, `nil` is returned.
    ///
    /// - returns: an optional boolean which will have the converted value, or `nil` if the conversion failed.
    func toBool() -> Bool? {
        switch lowercased() {
        case "true", "yes", "1": return true
        case "false", "no", "0": return false
        default: return nil
        }
    }
}

public extension String {

    /// Returns a localized string using the receiver as the key.
    var localized: String {
        return NSLocalizedString(self, comment: self)
    }

    func localized(with arguments: [CVarArg]) -> String {
        return String(format: localized, arguments: arguments)
    }

    func localized(with arguments: CVarArg...) -> String {
        return String(format: localized, arguments: arguments)
    }
}


public extension String {

    /// Creates a string from the `dump` output of the given value.
    init<T>(dumping x: T) {
        self.init()
        dump(x, to: &self)
    }
}
