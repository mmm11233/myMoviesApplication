//
//  HomePageTrendingCollectionCell.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 23.02.23.
//

import UIKit

class HomePageTrendingCollectionCell: UICollectionViewCell {

    @IBOutlet weak var trendingImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configure(with item: MoviesViewModel) {
        
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w342/\(item.image ?? "error")")!)) {
            (data, response,error) in
            
            do {
                var datas = try data
                DispatchQueue.main.async {
                    self.trendingImg.image = UIImage (data: datas!)
                }
            }catch{
                
            }
        }
        .resume ()
        
    }
    
}
