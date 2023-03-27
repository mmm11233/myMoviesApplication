//
//  SearchCell.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 02.03.23.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var topSearchImg: UIImageView!
    @IBOutlet weak var topSearchTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func configure(with item: TopSearcheViewModel) {
        topSearchTitle.text = item.title
        
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w342/\(item.image ?? "error")")!)) {
            (data, response,error) in
            
            do {
                var datas = try data
                DispatchQueue.main.async {
                    self.topSearchImg.image = UIImage (data: datas!)
                }
            }catch{
                
            }
        }
        .resume ()
        
    }
    
}
