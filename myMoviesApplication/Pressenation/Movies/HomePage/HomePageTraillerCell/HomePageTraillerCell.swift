//
//  HomePageCell.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 23.02.23.
//

import UIKit

class HomePageTraillerCell: UITableViewCell {
    
    @IBOutlet weak var trailerImg: UIImageView!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var downloadButton: UIButton!
    
    @IBOutlet weak var stackView: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        playButton.backgroundColor = .clear
        playButton.layer.cornerRadius = 5
        playButton.layer.borderWidth = 1
        playButton.layer.borderColor = UIColor.white.cgColor

        downloadButton.backgroundColor = .clear
        downloadButton.layer.cornerRadius = 5
        downloadButton.layer.borderWidth = 1
        downloadButton.layer.borderColor = UIColor.white.cgColor
          addradient()
       
    }
    
    
    
    @IBAction func onPlay(_ sender: Any) {
        
    }
    
    @IBAction func onDownload(_ sender: Any) {
        
    }
    
    
    
    private func addradient() {
       var gradient: CAGradientLayer = {
            let gradient = CAGradientLayer()
            gradient.type = .axial
            gradient.colors = [
                UIColor.clear.cgColor,
                UIColor.systemBackground.cgColor
            ]
            gradient.locations = [0.0, 5]
            return gradient
        }()
        
        gradient.frame = self.bounds
        trailerImg.layer.addSublayer(gradient)
    }
    
   
    func configure(with item: MoviesViewModel) {
        
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w342/\(item.image ?? "error")")!)) {
            (data, response,error) in
            
            do {
                var datas = try data
                DispatchQueue.main.async {
                    self.trailerImg.image = UIImage (data: datas!)
                }
            }catch{
                
            }
        }
        .resume ()
        
    }
    
}
