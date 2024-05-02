//
//  PlaylistDeleteViewController+TableView.swift
//  Lesson12HW
//
//  Created by Aleksandr Moroshovskyi on 03.04.2024.
//

import UIKit

// MARK: - UITableViewDelegate
extension PlaylistDeleteViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            model.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

// MARK: - UITableViewDataSource
extension PlaylistDeleteViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainPlaylistCell")
            else {
                assertionFailure()
                return UITableViewCell()
            }
            
            let item = model.items[indexPath.row]
            
            cell.textLabel?.text = "\(item.author) - \(item.songTitle)"
            cell.detailTextLabel?.text = "Album: \(item.albumTitle), Genre: \(item.genre)"
            
            return cell
    }
}
