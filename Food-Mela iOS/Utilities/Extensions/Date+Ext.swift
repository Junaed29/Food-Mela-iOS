//
//  Date+Ext.swift
//  Food-Mela iOS
//
//  Created by Junaed Muhammad Chowdhury on 31/3/23.
//

import Foundation


extension Date{
    var eighteenYearsAgo: Date{
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredTenYearsAgo: Date{
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
}
