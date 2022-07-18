//
//  ViewController.swift
//  FirstPokeApp
//
//  Created by CHRISTIAN BEYNIS on 7/15/22.
//

import UIKit

class ViewController: UIViewController {

    var indexP = 0

    lazy var progImageView2: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "PokeImg")
        return imageView
        
    }()
    
    lazy var Name: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(12)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        //label.text = "Pokemon_Name"
        label.backgroundColor = .systemOrange
        return label
    }()
    
    lazy var Types: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(12)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Pokemon_type"
        label.backgroundColor = .systemOrange
        return label
    }()
    
    
    lazy var Abilities: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(12)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Pokemon_Abilities"
//        label.backgroundColor = .systemOrange
        return label
    }()
    
    lazy var MovesList: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(12)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Pokemon_Moves"
//        label.backgroundColor = .systemOrange
        return label
    }()

    let network = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemTeal
        self.setUpUI()
        self.setLabels()
        self.setImages()
        // Do any additional setup after loading the view.
    }

    private func setUpUI() {
        
        self.view.addSubview(self.Name)
        self.view.addSubview(self.progImageView2)
        self.view.addSubview(self.Types)
        self.view.addSubview(self.Abilities)
        self.view.addSubview(self.MovesList)
        
        self.Name.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.Name.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.Name.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        self.progImageView2.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.progImageView2.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        
        self.Types.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.Types.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 50).isActive = true
        self.Types.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.Types.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        
    }
    
    func setLabels(){
        
        let pokemon = network.getPokemonDecodable()
        guard let pokemon = pokemon else { return }
        let name = String("\(pokemon[String(indexP+1)]![0])")
        self.Name.text = "Name: " + name
        let abilities = String("\(pokemon[String(indexP+1)]![1])")
        self.Abilities.text = "Abilities: " + abilities
        let type = String("\(pokemon[String(indexP+1)]![2])")
        self.Types.text = "Types: " + type
        let moves = String("\(pokemon[String(indexP+1)]![3])")
        self.MovesList.text = "moves: " + moves
    }
    
    func setImages (){
        
        self.network.fetchImageData(urlStr: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"+String(indexP+1)+".png"){
            result in switch result{
                
            case .success (let imageData):
                DispatchQueue.main.async{
                    self.progImageView2.image = UIImage(data: imageData)
                }
                
            case .failure(let error):
                print(error)

            
            
            
            }
            
        }
        
    }

        
  
//        self.Name.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        self.Name.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//
//        self.Name.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
//
//
//
//        self.view.addSubview(self.progImageView2)
//
//
//        self.progImageView2.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 48).isActive = true
//        self.progImageView2.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -48).isActive = true
//
//        self.progImageView2.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
////
//  //      self.progImageView2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 20).isActive = true
////
//        //self.progImageView2.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
//
//        self.progImageView2.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        self.progImageView2.widthAnchor.constraint(equalToConstant: 20).isActive = true
//
//        self.view.addSubview(self.Abilities)
//        self.view.addSubview(self.MovesList)
//
//
//        self.MovesList.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//        self.MovesList.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -50).isActive = true
//        self.MovesList.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        self.MovesList.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//
//        self.view.addSubview(self.decodableDecodeButton)
//        //self.view.addSubview(self.manualDecodeButton)
//
//        self.decodableDecodeButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//        self.decodableDecodeButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -50).isActive = true
//        self.decodableDecodeButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        self.decodableDecodeButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        
    
    
    
    }
