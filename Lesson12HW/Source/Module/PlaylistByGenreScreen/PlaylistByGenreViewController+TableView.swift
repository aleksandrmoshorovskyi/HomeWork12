//
//  PlaylistByGenreViewController+TableView.swift
//  Lesson12HW
//
//  Created by Aleksandr Moroshovskyi on 03.04.2024.
//

import UIKit

extension PlaylistByGenreViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return model.sections[section].group
    }
}

extension PlaylistByGenreViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return model.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainPlaylistCell")
            else {
                assertionFailure()
                return UITableViewCell()
            }
            
            //let item = model.items[indexPath.row]
            let item = model.sections[indexPath.section].rows[indexPath.row]
            
            cell.textLabel?.text = "\(item.author) - \(item.songTitle)"
            cell.detailTextLabel?.text = "Album: \(item.albumTitle), Genre: \(item.genre)"
            
            return cell
    }
}
