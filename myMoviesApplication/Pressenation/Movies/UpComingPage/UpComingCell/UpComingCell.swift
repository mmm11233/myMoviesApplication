//
//  UpComingCell.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 24.02.23.
//

import UIKit

class UpComingCell: UITableViewCell {
    
    @IBOutlet weak var upComingImg: UIImageView!
    
    @IBOutlet weak var upComingLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with item: UpcomingViewModel) {
        upComingLbl.text = item.title
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w342/\(item.image ?? "error")")!)) {
            (data, response,error) in
            
            do {
                var datas = try data
                DispatchQueue.main.async {
                    self.upComingImg.image = UIImage (data: datas!)
                }
            }catch{
                
            }
        }
        .resume ()
        
    }
    
}
