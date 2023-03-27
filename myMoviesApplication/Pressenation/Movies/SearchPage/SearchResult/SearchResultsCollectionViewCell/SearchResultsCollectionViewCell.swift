//
//  SearchResultsCollectionViewCell.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 03.03.23.
//

import UIKit

class SearchResultsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var searchResultImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with item: SearchResultsViewModel) {

        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w342/\(item.image ?? "error")")!)) {
            (data, response,error) in

            do {
                var datas = try data
                DispatchQueue.main.async {
                    self.searchResultImg.image = UIImage (data: datas!)
                }
            }catch{

            }
        }
        .resume ()
    }

}
