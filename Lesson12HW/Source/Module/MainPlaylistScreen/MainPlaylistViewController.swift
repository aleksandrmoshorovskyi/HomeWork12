//
//  MainPlaylistViewController.swift
//  Lesson12HW
//

//

import UIKit

class MainPlaylistViewController: UIViewController {
    
    @IBOutlet weak var contentView: MainPlaylistView!
    var model: MainPlaylistModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
        model.loadData()
    }
    
    private func setupInitialState() {
        
        model = MainPlaylistModel()
        model.delegate = self
        
        contentView.delegate = self
        
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
}

extension MainPlaylistViewController: MainPlaylistModelDelegate {
    
    func dataDidLoad() {
        contentView.tableView.reloadData()
    }
}

extension MainPlaylistViewController: MainPlaylistViewDelegate {
    
}

extension MainPlaylistViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainPlaylistCell")
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        //cell.textLabel?.text = model.items[indexPath.row].songTitle
        
        let item = model.items[indexPath.row]
        
        cell.textLabel?.text = "\(item.author) - \(item.songTitle)"
        cell.detailTextLabel?.text = "Album: \(item.albumTitle), Genre: \(item.genre)"
        
        return cell
    }
}

extension MainPlaylistViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
