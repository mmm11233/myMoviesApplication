//
//  HomePageTrendingCell.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 23.02.23.
//

import UIKit

class HomePageTrendingCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var dataSourse: [MoviesViewModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .black
        self.collectionView.register(UINib(nibName: "HomePageTrendingCollectionCell", bundle: nil), forCellWithReuseIdentifier: "HomePageTrendingCollectionCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(_ dataSourse: [MoviesViewModel]) {
        self.dataSourse = dataSourse
        collectionView.reloadData()
    }
        
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSourse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePageTrendingCollectionCell", for: indexPath) as! HomePageTrendingCollectionCell
        cell.configure(with: dataSourse[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 180, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 10, bottom: 0, right: 10)
    }
    

}
