//
//  PlaylistMoveDeleteViewController.swift
//  Lesson12HW
//

//

import UIKit

class PlaylistMoveDeleteViewController: UIViewController {
    
    @IBOutlet weak var contentView: PlaylistMoveDeleteView!
    var model: PlaylistMoveDeleteModel!
    var btn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
        model.loadData()
    }
    
    private func setupInitialState() {
        
        model = PlaylistMoveDeleteModel()
        model.delegate = self
        
        contentView.delegate = self
        
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        
        btn = UIBarButtonItem(
            title: "Edit",
            style: .plain,
            target: self,
            action: #selector(self.editButtonDidTap)
        )
        
        self.navigationItem.rightBarButtonItem = btn
    }
    
    @objc func editButtonDidTap() {
        contentView.tableView.isEditing = !contentView.tableView.isEditing
        btn.title = contentView.tableView.isEditing ? "Done" : "Edit"
    }
}

extension PlaylistMoveDeleteViewController: PlaylistMoveDeleteModelDelegate {
    
    func dataDidLoad() {
        contentView.tableView.reloadData()
    }
}

extension PlaylistMoveDeleteViewController: PlaylistMoveDeleteViewDelegate {
    
}
