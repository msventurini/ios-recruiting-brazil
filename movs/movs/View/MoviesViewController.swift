//
//  MoviesViewController.swift
//  movs
//
//  Created by Matheus Silveira Venturini on 25/09/22.
//

import UIKit

class MoviesViewController: UIViewController {
    
    
    
    enum Section {
        case main
    }
    
    var movies: [Movie] = []
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Movie>!
    
    var page = 1
    var hasMorePages = true
    
    var apiKey: String? {
        return Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigation()
        self.setupTabBar()
        self.setupMainScreen()
        
        configureCollectionView()
        getMovies()
        configureDataSource()
        
    }
    
    func getMovies() {
        let containerView = showActivityIndicatorView()
        MoviesFetcher.shared.getPopularMovies(for: apiKey!, page: page) { [weak self] result in
            guard let self = self else { return }
            self.dismissActivityIndicatorView(containerView: containerView)
            switch result{
            case .success(let response):
                if (self.page == response.total_pages) { self.hasMorePages = false}
                self.movies.append(contentsOf: response.results)
                self.updateData()
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Movie>()
        snapshot.appendSections([.main])
        snapshot.appendItems(movies)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Movie>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, movie) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
            cell.set(movie: movie)
            
            return cell
        })
    }
    
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createTwoColumnFlowLayout(in: self.view))
        
        view.addSubview(collectionView)
        collectionView.delegate = self

        collectionView.backgroundColor = .systemBackground
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
        
    }
    
    
    
    func createTwoColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        
        let width = view.bounds.width
        let padding: CGFloat = (width/50)
        let minimumItemSpacing: CGFloat = (width/25)
        let availableWidth = width - (padding * 2) - (minimumItemSpacing)
        let itemWidth = availableWidth / 2
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        return flowLayout
    }
    
    
    func showActivityIndicatorView() -> UIView {
                
        let containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        activityIndicator.startAnimating()
        
        return containerView
    }
    
    func dismissActivityIndicatorView(containerView: UIView){
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
        }
    }


}

extension MoviesViewController: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY         = scrollView.contentOffset.y
        let contentHeight   = scrollView.contentSize.height
        let height          = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMorePages else { return }
            page += 1
            getMovies()
        }
    }
    


    
    
}
