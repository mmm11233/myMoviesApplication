//
//  UpComingViewController.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 22.02.23.
//

import UIKit

class UpComingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource: UpComingDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewModel()
        
    }
    

    private func configureViewModel() {
        
        dataSource = UpComingDataSource(tableView: tableView)
        
    }

}
