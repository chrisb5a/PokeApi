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
    var currentPage = 0
    
    lazy var PokeTable: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.backgroundColor = .systemCyan
        table.delegate = self
        table.prefetchDataSource = self
        // Register
        table.register(ProgTableViewCell.self, forCellReuseIdentifier: ProgTableViewCell.reuseID)
        return table
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.setUpUI()
        
        self.requestPage()
        
        
    }
    
    private func setUpUI(){
        self.view.addSubview(self.PokeTable)
        self.PokeTable.bindToSuperView()
    
    }
    
    private func requestPage(){
        
        for i in 1...150{
            PokePics1.append(i)
        }
        
        let url_left = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
        let url_right = ".png"
        var url_middle = String(self.currentPage+1)
        
        self.network.getData(url: URL(string: url_left + url_middle + url_right)){
            result in
            
            switch result{
            case .success(let data):
                self.currentPage += 1
                self.PokePics.append(UIImage(data: data) ?? UIImage(named:"Mean_1000")!)
                DispatchQueue.main.async {
                    self.PokeTable.reloadData()
                }
            case .failure(let error):
                print(error)
            
            }
        }
        
        
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
    }
    
}

extension MainViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let lastIndexPath = IndexPath(row: self.PokePics.count - 1, section :0)
        guard indexPaths.contains(lastIndexPath) else {return}
        self.requestPage()
    }
        
    }


