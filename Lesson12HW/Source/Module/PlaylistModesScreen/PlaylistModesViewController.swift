//
//  PlaylistModesViewController.swift
//  Lesson12HW
//

//

import UIKit

class PlaylistModesViewController: UIViewController {
    
    @IBOutlet weak var contentView: PlaylistModesView!
    var model: PlaylistModesModel!
    var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
        model.loadDataFor(SegmentEnum.All)
    }
    
    private func setupInitialState() {
        
        model = PlaylistModesModel()
        model.delegate = self
        
        contentView.delegate = self
        
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        
        segment = UISegmentedControl(items: SegmentEnum.allValues())
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(self.segmentValueChanged), for: .valueChanged)
        self.navigationItem.titleView = segment
    }
    
    @objc func segmentValueChanged() {
        model.loadDataFor(SegmentEnum(rawValue: segment.selectedSegmentIndex) ?? SegmentEnum.All)
    }
}

extension PlaylistModesViewController: PlaylistModesModelDelegate {
    
    func dataDidLoad() {
        contentView.tableView.reloadData()
    }
}

extension PlaylistModesViewController: PlaylistModesViewDelegate {
    
}
