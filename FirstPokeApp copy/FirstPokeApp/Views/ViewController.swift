//
//  ViewController.swift
//  FirstPokeApp
//
//  Created by CHRISTIAN BEYNIS on 7/15/22.
//

import UIKit

class ViewController: UIViewController {

//    lazy var manualDecodeButton: UIButton = {
//        let button = UIButton(frame: .zero)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Manually Decode Data", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = .systemBlue
//        button.layer.cornerRadius = 15.0
//        button.addTarget(self, action: #selector(self.manualDecodeButtonPressed), for: .touchUpInside)
//        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
//        return button
//    }()
    var indexP = 0
    var data = UIImage()
//    var data = callNetwork2(val: indexP)
    
    
    lazy var decodableDecodeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Decodable Decode Data", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15.0
        button.addTarget(self, action: #selector(self.decodableButtonPressed), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return button
    }()
    
    lazy var progImageView2: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = callNetwork2(val: indexP)
        return imageView
        
    }()

    
    let network = NetworkManager()
    
    @objc
    func decodableButtonPressed() {
        let pokemon = network.getPokemonDecodable()
        //self.network.getPokemonDecodable()
        self.presentPokemonAlert(pokemon: pokemon, val: indexP)
    }
    
//    @objc
//    func manualDecodeButtonPressed() {
//
//        let pokemon = self.network.getPokemonManually()
//        self.presentPokemonAlert(pokemon: pokemon)
//    }
    
    func presentPokemonAlert(pokemon: Pokemon?, val: Int) {
        guard let pokemon = pokemon else { return }
        //var names = [String]()
        //pokemon.forEach( value in names.append(value))
        
//        let names = "\(Array(pokemon.keys))"
//        var name_arr = Array(pokemon.keys)
        
        
//        let names1 = pokemon.pokemon.compactMap { $0.pokemon.name }.reduce("") { partialResult, name in
//            return partialResult + name + "\n"
//        }
        
        
        
        //print("\(String(describing: pokemon))")
//        let names = pokemon.pokemon
//        print("\(names)")
//        print("ok")
        
//        let alert = UIAlertController(title: "name", message: "\(names)", preferredStyle: .alert)
//        let action = UIAlertAction(title: "Fuck Off", style: .default, handler: nil)
//        alert.addAction(action)
//        DispatchQueue.main.async {
//            self.present(alert, animated: true, completion: nil)}

        let alert = UIAlertController(title: "names", message: String("\(pokemon[String(val+1)]![0])") , preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Sounds Good", style: .default, handler: nil)
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }


    }
    
    
    private func callNetwork2(val: Int)->UIImage{
        
            
            
            let name_url_left = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
            let name_url_right = ".png"
            
            
            
            
            
            let url = URL(string: name_url_left + String(val+1) + name_url_right)
            
            network.getData(url: url) { result in
                switch result {
                
                case .success(let data):
                    //self.currentPok += 1
                    //self.PokInfo.append(1)
                    DispatchQueue.main.async {
                        self.data = UIImage(data: data) ?? UIImage(named: "Mean_1")!
//                        self.table.reloadData()
                        print("\(val)")
                        
                        
                    }
                    
                    
                
                case .failure(let error):
                    print(error)
                    DispatchQueue.main.async {
                        return
                        
                    }
                }
            
            
            
            
        }
        
        
        return self.data
        
    }
    
    
    //var indexP = 0
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemTeal
        
        self.setUpUI()
        

        // Do any additional setup after loading the view.
    }

    
    
    
    private func setUpUI() {
        
        //self.progImageView2.image = callNetwork2(val:1)
        self.view.addSubview(self.progImageView2)
        //print("okookkkkk", "\(self.progImageView2.image)")
        
        
        self.progImageView2.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.progImageView2.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//
        self.progImageView2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 44).isActive = true
//
        self.progImageView2.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
       
        self.progImageView2.heightAnchor.constraint(equalToConstant: 80).isActive = true
        self.progImageView2.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        self.view.addSubview(self.decodableDecodeButton)
        //self.view.addSubview(self.manualDecodeButton)
        
        self.decodableDecodeButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.decodableDecodeButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -50).isActive = true
        self.decodableDecodeButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.decodableDecodeButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        
    }
    
    
    }
