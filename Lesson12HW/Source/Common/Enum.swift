//
//  Enum.swift
//  Lesson12HW
//
//  Created by Aleksandr Moroshovskyi on 04.04.2024.
//

import Foundation

enum SegmentEnum: Int, CaseIterable {
    case All = 0
    case Genre
    case Author
    
    static func allValues() -> [String] {
        return [All, Genre, Author].map({$0.description})
    }

    public var description: String {
        switch self {
        case .All:
            return "All"
        case .Genre:
            return "Genre"
        case .Author:
            return "Author"
        }
    }
}

/*
 enum Size: Int, CustomStringConvertible {
     case S = 0
     case M
     case L
     case XL

     static func allValues() -> [String] {
         return [S, M, L, XL].map({$0.description})
     }

     static func count() -> Int {
         return allValues().count
     }

     public var description: String {
         switch self {
         case .S:
             return "S"
         case .M:
             return "M"
         case .L:
             return "L"
         case .XL:
             return "XL"
         }
     }
 }
 */
