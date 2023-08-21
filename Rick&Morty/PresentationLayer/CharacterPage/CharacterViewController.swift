//
//  CharacterViewController.swift
//  Rick&Morty
//
//  Created by Егор  Хлямов on 18.08.2023.
//

import Foundation
import UIKit

class CharacterViewController: UIViewController {
    var currentPage:Int = 1
    var character:Character
    var maxPages:Int? = 0
    var planet:Planet?
    var lastFetchTime: Date?
    var episodes:[Episode] = []
    var data: [Character] = []
    var mainView: CharacterView
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.didLoad()
        mainView.backButton.addTarget(self, action: #selector(closeVC), for: .touchUpInside)
    }
    override func loadView() {
        view = mainView
    }
    @objc func closeVC(){
        dismiss(animated: true,completion: nil)
    }
    func loadData(){
        
        NetworkManager.shared.getImage(url: character.image){image in
            self.mainView.avatar.image = image
        }
        for episode in character.episode{
            let url = URL(string: episode)!
            NetworkManager.shared.getEpisodeInfo(url:url){ result in
                self.episodes.append(result)
            }
        }
        guard let url = URL(string: character.origin.url) else {return}
        NetworkManager.shared.getOriginInfo(url:url){ result in
            self.planet = result
        }
        mainView.reloadView()
    }
    
    init(mainView: CharacterView, character:Character) {
        self.mainView = mainView
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getEpisodegCell(tableView: UITableView, indexPath: IndexPath)-> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: EpisodeCell.reuseIdentifier,
            for: indexPath
        ) as? EpisodeCell else { return UITableViewCell() }
        
        cell.nameLabel.text = episodes[indexPath.row].name
        
        let inputString = episodes[indexPath.row].episode
        if let rangeOfS = inputString.range(of: "S"),
           let rangeOfE = inputString.range(of: "E", range: rangeOfS.upperBound..<inputString.endIndex),
           let seasonNumber = Int(inputString[rangeOfS.upperBound..<rangeOfE.lowerBound]),
           let episodeNumber = Int(inputString[rangeOfE.upperBound...]) {
            
            cell.numLabel.text = "Episode: \(episodeNumber), Season: \(seasonNumber)"
        }
        cell.dateLabel.text = episodes[indexPath.row].air_date
        

        //print("Episode: \(episodeNum), Season: \(seasonNum)")
        return cell

    }


}

extension CharacterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("----")
        print(episodes.count)
        print("----")
        return episodes.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getEpisodegCell(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 102
    }

}
