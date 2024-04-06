//
//  Common.swift
//  Lesson12HW
//
//  Created by Aleksandr Moroshovskyi on 04.04.2024.
//

import Foundation

struct Section {
    
    var group = ""
    var rows: [Song] = []
}

class CommonModel: NSObject {
    
    // MARK: - convertArrayNewVersion
    func convertArray(_ sourceArray: [Song], for segment: SegmentEnum) -> [Section] {
        
        let groupedData = Dictionary(grouping: sourceArray) {
    
            switch segment {
            case .All:
                ""
            case .Genre:
                $0.genre
            case .Author:
                $0.author
            }
        }
        
        var destinationArray: [Section] = groupedData.compactMap {
            key, value in
            return Section(group: key, rows: value)
        }
        
        destinationArray.sort() { $0.group < $1.group}
        
        return destinationArray
    }
    
    // MARK: - convertArrayOldVersion
    func convertArrayOldVersion(_ sourceArray: [Song], for segment: SegmentEnum) -> [Section] {
        
        var dict: [String: [Song]] = [:]
        
        for item in sourceArray {
            
            var groupItem = ""
            
            switch segment {
            case .All:
                groupItem = ""
            case .Genre:
                groupItem = item.genre
            case .Author:
                groupItem = item.author
            }
            
            if dict[groupItem] == nil {
                dict[groupItem] = [item]
            } else {
                dict[groupItem]?.append(item)
            }
        }
        
        let sortedKeys = Array(dict.keys).sorted(by: <)
            
        var destinationArray: [Section] = []
            
        for key in sortedKeys {
            let section = Section(group: key, rows: dict[key] ?? [])
            destinationArray.append(section)
        }
        
        return destinationArray
    }
}


