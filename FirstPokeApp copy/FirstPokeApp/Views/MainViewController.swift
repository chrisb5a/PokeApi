//
//  MainViewController.swift
//  FirstPokeApp
//
//  Created by CHRISTIAN BEYNIS on 7/15/22.
//

import UIKit



class MainViewController: UIViewController {
    
    let network: NetworkManager = NetworkManager()
    var PokePics: [UIImage] = []
    var PokePics1: [Int] = []
    
    lazy var PokeTable: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.backgroundColor = .systemCyan
        table.delegate = self
        // Register
        table.register(ProgTableViewCell.self, forCellReuseIdentifier: ProgTableViewCell.reuseID)
        return table
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.setUpUI()
        
        for i in 1...151{
            PokePics1.append(i)
        }
        
        self.network.getData(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/30.png")){
            result in
            
            switch result{
            case .success(let data):
                print(data)
                self.PokePics.append(UIImage(data: data) ?? UIImage(named:"Mean_1000")!)
                DispatchQueue.main.async {
                    self.PokeTable.reloadData()
                }
            case .failure(let error):
                print(error)
            
            }
        }
        
        
    }
    
    private func setUpUI(){
        self.view.addSubview(self.PokeTable)
        self.PokeTable.bindToSuperView()
    
    }
}




extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.PokePics1.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProgTableViewCell.reuseID, for: indexPath) as? ProgTableViewCell else{
            return UITableViewCell()
        }
        let pokemon = network.getPokemonDecodable()
        guard let pokemon = pokemon else {
            return cell
        }

        var titletxt: String
        var Ovtext: String
        titletxt = String( "\(pokemon[String(indexPath.row+1)]![0])")
        Ovtext = "\(pokemon[String(indexPath.row+1)]![2])"
        cell.titleLabel.text = titletxt
        cell.overviewLabel.text = Ovtext
        
        //cell.configure(Pokepics: self.PokePics[indexPath.row])
        self.network.fetchImageData(urlStr: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"+String(self.PokePics1[indexPath.row])+".png"){
            result in switch result{
                
            case .success (let imageData):
                DispatchQueue.main.async{
                    cell.pokeImageView.image = UIImage(data: imageData)
                }
                
            case .failure(let error):
                print(error)

            
            
            
            }
            
        }
        return cell
    }
}
    
extension MainViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = ViewController()
        self.navigationController?.pushViewController(detailVc, animated: true)
        detailVc.indexP = indexPath.row
        print( "HHHHHHHHHHHHHHHHHHHHHEEeeeeeeeeeeerrrrrrrrrreeeeee")
    }}


