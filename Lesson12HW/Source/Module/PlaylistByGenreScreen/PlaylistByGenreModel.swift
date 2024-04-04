//
//  PlaylistByGenreModel.swift
//  Lesson12HW
//

//

import Foundation

protocol PlaylistByGenreModelDelegate: AnyObject {

    func dataDidLoad()
}

class PlaylistByGenreModel: CommonModel {

    weak var delegate: PlaylistByGenreModelDelegate?
    private let dataLoader = DataLoaderService()
    
    //var items: [Song] = []
    var sections: [Section] = []
    
    func loadDataFor(_ segment: SegmentEnum) {
        
        dataLoader.loadPlaylist { playlist in
            
            let allPlaylist = playlist?.songs ?? []
            
            self.sections = self.convertArray(allPlaylist, for: SegmentEnum.Genre)
            
            self.delegate?.dataDidLoad()
        }
    }
}
