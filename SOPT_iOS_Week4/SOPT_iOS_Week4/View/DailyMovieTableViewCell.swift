//
//  DailyMovieTableViewCell.swift
//  SOPT_iOS_Week4
//
//  Created by 박윤빈 on 2023/05/11.
//

import UIKit

import Kingfisher
import SnapKit

final class DailyMovieTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private var imageURL: URL?
    
    // MARK: - UI Components
    
    private lazy var posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 17)
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var overViewLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        label.textColor = .darkGray
        label.numberOfLines = 9
        return label
    }()
    
    private lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 13)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        setLayout()
    }
        
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Functions
    
    private func configureUI() {
        contentView.addSubviews(posterImage,
                                movieTitleLabel,
                                overViewLabel,
                                releaseDateLabel)
    }
    
    private func setLayout() {
        posterImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(6)
            make.height.equalTo(130)
            make.width.equalTo(100)
        }
        
        movieTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(6)
        }
        
        overViewLabel.snp.makeConstraints { make in
            make.top.equalTo(movieTitleLabel.snp.bottom).offset(6)
            make.width.equalTo(250)
            make.leading.equalTo(movieTitleLabel)
        }
        
        releaseDateLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(5)
            make.leading.equalTo(movieTitleLabel)
        }
    }
    
    func configureCell(_ results: Results){
        imageURL = URL(string: "https://image.tmdb.org/t/p/original/" + (results.poster_path ?? "") ) ?? nil
        movieTitleLabel.text = results.original_title
        overViewLabel.text = results.overview
        releaseDateLabel.text = "release date: \(results.release_date)"
        posterImage.kf.setImage(with: imageURL)
    }
}

