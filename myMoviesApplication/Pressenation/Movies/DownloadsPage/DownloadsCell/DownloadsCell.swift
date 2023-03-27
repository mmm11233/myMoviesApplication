//
//  DownloadsCell.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 02.03.23.
//

import UIKit

class DownloadsCell: UITableViewCell {

    @IBOutlet weak var downloadImg: UIImageView!
    @IBOutlet weak var downloadTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with item: MoviesViewModel ) {
        downloadTitle.text = item.title
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w342/\(item.image ?? "error")")!)) {
            (data, response,error) in
            
            do {
                var datas = try data
                DispatchQueue.main.async {
                    self.downloadImg.image = UIImage (data: datas!)
                }
            }catch{
                
            }
        }
        .resume ()
        
    }

    }
    

