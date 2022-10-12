//
//  MovieCell.swift
//  movs
//
//  Created by Matheus Silveira Venturini on 10/10/22.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    static let reuseID = "MovieCell"
    
    var image = UIImageView(frame: .zero)
    let movieTitle = UILabel(frame: .zero)
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(movie: Movie) {

        PosterFetcher.shared.getMoviePoster(from: movie.poster_path) { image in
            DispatchQueue.main.async {
                self.image.image = image
            }
        }

        //image.image = (UIImage(named: "DBSSHPoster"))

        movieTitle.text = movie.title
        print(movie.poster_path)
    }
    

    private func configure() {
        
        image.translatesAutoresizingMaskIntoConstraints = false
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(image)
        addSubview(movieTitle)
        
        let padding: CGFloat = 0
        
        clipsToBounds = true
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            image.heightAnchor.constraint(equalTo: self.widthAnchor),
            
            movieTitle.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 12),
            movieTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            movieTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            movieTitle.heightAnchor.constraint(equalToConstant: 20)
            
            
        ])
        
    }
    
    
}
