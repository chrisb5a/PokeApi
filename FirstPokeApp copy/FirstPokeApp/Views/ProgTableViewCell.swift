//
//  ProgTableViewCell.swift
//  FirstPokeApp
//
//  Created by CHRISTIAN BEYNIS on 7/15/22.
//

import UIKit

class ProgTableViewCell: UITableViewCell {

       static let reuseID = "\(ProgTableViewCell.self)"
    
    
    lazy var pokeImageView: UIImageView =  {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemCyan
        imageView.image = UIImage(named: "Mean_1")
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(12)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Pokemon"
        label.backgroundColor = .systemOrange
        return label
    }()
    
    lazy var overviewLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(12)
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        label.text = "Pokemon attributes"
        label.backgroundColor = .systemGray2
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUpUI()
    }
    
    required init? (coder: NSCoder){
        fatalError("Init(coder) has not been implemented")
    }
    
    private func setUpUI(){
        
        let hStack = UIStackView(axis: .horizontal , spacing: 8, distribution: .fill)
        let vStack = UIStackView(axis: .vertical , spacing: 8, distribution: .fill)
        
        vStack.addArrangedSubview(self.titleLabel)
        vStack.addArrangedSubview(self.overviewLabel)
        
        hStack.addArrangedSubview(self.pokeImageView)
        hStack.addArrangedSubview(vStack)
        
        self.contentView.addSubview(hStack)
        
        hStack.bindToSuperView()
        
    }
    
    func configure(Pokepics: UIImage){
        //self.pokeImageView.image =
        self.titleLabel.text = "Pokemon"
        self.overviewLabel.text = "Attributes"
    }
    
    override func prepareForReuse(){
        self.titleLabel.text = "Pokemon"
        self.overviewLabel.text = "Pokemon Description"
        self.pokeImageView.image = UIImage(named: "Mean_1")
    }
    

}
