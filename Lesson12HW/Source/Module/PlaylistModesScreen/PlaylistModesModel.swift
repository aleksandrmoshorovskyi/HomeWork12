//
//  PlaylistModesModel.swift
//  Lesson12HW
//

//

import Foundation

protocol PlaylistModesModelDelegate: AnyObject {

    func dataDidLoad()
}

class PlaylistModesModel: CommonModel {
    
    weak var delegate: PlaylistModesModelDelegate?
    private let dataLoader = DataLoaderService()
    
    //var items: [Song] = []
    var sections: [Section] = []
    
    func loadDataFor(_ segment: SegmentEnum) {
        
        dataLoader.loadPlaylist { playlist in
            
            let allPlaylist = playlist?.songs ?? []
            
            self.sections = self.convertArray(allPlaylist, for: segment)
            
            self.delegate?.dataDidLoad()
        }
    }
}
