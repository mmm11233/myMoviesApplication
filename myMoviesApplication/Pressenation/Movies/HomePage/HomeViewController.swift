//
//  HomeViewController.swift
//  myMoviesApplication
//
//  Created by Mariam Joglidze on 22.02.23.
//

import UIKit
class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var viewModel: MoviesListViewModel!
    private var dataSource: MoviesDataSource!
    private var moviesService: MoviesService!

     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .black
        configureViewModel()
        
        configureNavBar()
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .black
        
        navigationItem.standardAppearance = barAppearance
        navigationItem.scrollEdgeAppearance = barAppearance
        
    }

    
    
    private func configureNavBar() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        imageView.contentMode = .scaleAspectFit
        var image = UIImage(named: "netflix")!.alpha(0.45)
        imageView.image = image
        image = image.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        
        let imageView2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        imageView2.contentMode = .scaleAspectFit
        var imageProfile = UIImage(named: "profile")!.alpha(0.6)
        imageView2.image = imageProfile
        imageProfile = imageProfile.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: imageProfile, style: .done, target: self, action: nil)
    }
    
    
    private func configureViewModel() {
        moviesService = MoviesService(webServiceManager: WebServiceManager())
        viewModel = MoviesListViewModel(moviesService: moviesService)
        dataSource = MoviesDataSource(tableView: tableView, viewModel: viewModel, navigation: navigationController!, scrollView: scrollView)
    }
    
    
   
}

extension UIImage {
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
