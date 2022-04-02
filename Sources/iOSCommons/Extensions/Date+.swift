//
//  Date+.swift
//  
//
//  Created by Bruno Maciel on 10/16/21.
//

import Foundation

extension Date {
    enum ComparisonMode {
        case equal, before, after, equalOrBefore, equalOrAfter
    }
    
    func isBefore(_ date: Date, granularity: Calendar.Component) -> Bool {
        return compared(to: date, is: .before, granularity: granularity)
    }
    
    func isAfter(_ date: Date, granularity: Calendar.Component) -> Bool {
        return compared(to: date, is: .after, granularity: granularity)
    }
    
    func compared(to date: Date, is compareMode: ComparisonMode, granularity: Calendar.Component) -> Bool {
        let comparison = Calendar.current.compare(self, to: date, toGranularity: granularity)
        
        switch compareMode {
            case .equal:
                return comparison == .orderedSame
            case .before:
                return comparison == .orderedAscending
            case .after:
                return comparison == .orderedDescending
            case .equalOrBefore:
                return comparison == .orderedAscending || comparison == .orderedSame
            case .equalOrAfter:
                return comparison == .orderedDescending || comparison == .orderedSame
        }
    }
    
    func add(_ value: Int, toComponent component: Calendar.Component) -> Date? {
        return Calendar.current.date(byAdding: component, value: value, to: self)
    }
}


class DateManager {
    enum DateFormat: String {
        /// format: `dd/MM/yyyy`
        case ddMMyyyy = "dd/MM/yyyy"
        
        /// format: `dd/MM/yyyy HH:mm`
        case ddMMyyyy_datetime = "dd/MM/yyyy HH:mm"
        
        /// format: `MM/dd/yyyy`
        case MMddyyyy = "MM/dd/yyyy"
        
        /// format: `yyyy-MM-dd`
        case iso_short = "yyyy-MM-dd"
        
        /// format: `yyyy-MM-dd HH:mm`
        case iso_datetime = "yyyy-MM-dd HH:mm"
        
        /// format: `yyyy-MM-dd'T'HH:mm:ss.SSS'Z'`
        case iso = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    }
    
    // MARK: Properties
    var dateFormatter: DateFormatter
    private var dateFormatterUTC: DateFormatter
    
    // MARK: Constructor
    init(formatter: DateFormatter) {
        self.dateFormatter = formatter
        
        self.dateFormatterUTC = {
            let formatterUTC = DateFormatter()
            formatterUTC.timeZone = TimeZone(identifier: "UTC")
            return formatterUTC
        }()
    }
    
    init() {
        let defaultDateFormat = "dd/MM/yyyy"
        
        self.dateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = defaultDateFormat
            formatter.timeZone = NSTimeZone(forSecondsFromGMT: TimeZone.current.secondsFromGMT()) as TimeZone
            return formatter
        }()
        
        self.dateFormatterUTC = {
            let formatterUTC = DateFormatter()
            formatterUTC.dateFormat = defaultDateFormat
            formatterUTC.timeZone = TimeZone(identifier: "UTC")
            return formatterUTC
        }()
    }
    
    
    // MARK: - Methods
    
    func formatDate(_ date: Date, as format: DateFormat) -> String {
        return formatDate(date, as: format.rawValue)
    }
    
    func formatDate(_ date: Date, as format: String) -> String {
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: date)
    }
    
    func getDate(from string: String, format: DateFormat, utc: Bool=false) -> Date? {
        guard utc else { return getDate(from: string, format: format.rawValue) }
        
        dateFormatterUTC.dateFormat = format.rawValue
        return dateFormatterUTC.date(from: string)
    }
    
    func getDate(from string: String, format: String) -> Date? {
        dateFormatter.dateFormat = format
        
        return dateFormatter.date(from: string)
    }
    
    func convertDate(_ dateString: String, from originFormat: DateFormat, to destinyFormat: DateFormat) -> String? {
        return convertDate(dateString, fromFormat: originFormat.rawValue, toFormat: destinyFormat.rawValue)
    }
    
    func convertDate(_ dateString: String, fromFormat originFormat: String, toFormat destinyFormat: String) -> String? {
        guard let date = getDate(from: dateString, format: originFormat) else { return nil }
        
        return formatDate(date, as: destinyFormat)
    }
}
