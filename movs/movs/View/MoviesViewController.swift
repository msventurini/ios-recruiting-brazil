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
        MoviesFetcher.shared.getPopularMovies(for: apiKey!, page: 1) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result{
            case .success(let movies):
                self.movies = movies
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
            cell.set()
            
            return cell
        })
    }
    
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createTwoColumnFlowLayout(in: self.view))
        
        view.addSubview(collectionView)
        
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
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        return flowLayout
    }


}
