//
//  DownloadMoviesDataSource.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 02.03.23.
//

import UIKit

class DownloadMoviesDataSource: NSObject, UITableViewDataSource {
    
    
    private let tableView: UITableView
    
    
    
    init(
        tableView: UITableView
    ) {
        self.tableView = tableView
        super.init()

        self.tableView.dataSource = self

       self.tableView.register(UINib(nibName: "DownloadsViewController", bundle: nil), forCellReuseIdentifier: "DownloadsViewController")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DownloadsViewController", for: indexPath) as! DownloadsViewController
//        cell.configure()
    }
}

//extension DownloadMoviesDataSource: DownloadsDelegate{
//    func downloadDidTapped(movie: MoviesViewModel) {
//        let storyboard = UIStoryboard(name: "DownloadsViewController", bundle: nil)
//        let vC = storyboard.instantiateViewController(withIdentifier: "DownloadsViewController") as! DownloadsViewController
////        navigation.pushViewController(vC, animated: true)
//    }
//    
//    
//}

