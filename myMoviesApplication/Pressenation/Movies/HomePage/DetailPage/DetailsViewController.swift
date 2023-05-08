//
//  DetailsViewController.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 02.03.23.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var detailDescription: UILabel!
    
    private var moviesService: MoviesService!
    private var moviesDetails = [MoviesViewModel]()
    
    var detailsMovies: MoviesViewModel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        if let detailsMovies = detailsMovies {
            configure(with: detailsMovies)
        }
    }

    @IBAction func onDownload(_ sender: Any) {
        
    }
    
 
    func configure(with item: MoviesViewModel) {
        detailTitle.text = item.title
        detailDescription.text = item.description
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://image.tmdb.org/t/p/w342/\(item.image ?? "error")")!)) {
            (data, response,error) in
            
            do {
                var datas = try data
                DispatchQueue.main.async {
                    self.detailImg.image = UIImage (data: datas!)
                }
            }catch{
                
            }
        }
        .resume ()
        
    }
    

}
