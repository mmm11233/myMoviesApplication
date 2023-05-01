//
//  HomePageTrendingCell.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 23.02.23.
//

import UIKit

protocol MoviesDetailsDelegate: class {
    func didSelect(movie: MoviesViewModel)
}


class HomePageTrendingCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var dataSourse: [MoviesViewModel] = []
    weak var delegate: MoviesDetailsDelegate!
    var selectedIndex = 2
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .black
        self.collectionView.register(UINib(nibName: "HomePageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomePageTrendingCollectionCell")
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
        cell.backgroundColor = .black
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 180, height: 230)
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        let storyboard = UIStoryboard(name: "DetailsViewController", bundle: nil)
//        let vC = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
//        vC.detailsMovies = movie
//        navigationController?.pushViewController(vC, animated: true)

        delegate.didSelect(movie: dataSourse[indexPath.row])
        
        if let cell = collectionView.cellForItem(at: indexPath){
            cell.animate()
            self.selectedIndex =  indexPath.row
            collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       cell.alpha = 0
       UIView.animate(withDuration: 0.8) {
           cell.alpha = 1
       }
   }
    
}
       


    
extension UICollectionViewCell {
    func animate(completion: (() -> Void)? = nil) {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = 1.9
        animation.fromValue = 1.5
        animation.toValue = 0.8
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        layer.add(animation, forKey: "scale")
    }
}





