//
//  MainViewController.swift
//  Rick&Morty
//
//  Created by Егор  Хлямов on 16.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    var currentPage:Int = 1
    var maxPages:Int? = 0
    var lastFetchTime: Date?
    
    var data: [Character] = []
    var service: NetworkManager
    var mainView: MainView
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        mainView.didLoad()
    }
    override func loadView() {
        view = mainView
    }
    
    init(mainView: MainView, service: NetworkManager) {
        self.mainView = mainView
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

        
    private func loadData(){
            NetworkManager.shared.getAllCharacters(page:String(currentPage)) { data in
            self.data = data.results
            self.mainView.loadData()
            self.maxPages = data.info.pages
            self.mainView.reloadView()
        }
    }
    
    private func loadMoreData(){
        NetworkManager.shared.getAllCharacters(page:String(currentPage)) { data in
            self.data += data.results
            self.mainView.loadData()
            self.mainView.reloadView()
        }
    }
    
    func loadMoreDataIfNeeded() {
        let currentTime = Date()
        
        // Проверяем, прошло ли более 1 секунды с момента последней загрузки данных
        if let lastFetchTime = lastFetchTime, currentTime.timeIntervalSince(lastFetchTime) < 1 {
            return // Если меньше 1 секунды, не загружаем
        }
        currentPage += 1
        lastFetchTime = currentTime
        loadMoreData()
    }
    
    func getCharacterCell(collectionView: UICollectionView, indexPath: IndexPath)-> UICollectionViewCell{
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CharacterCell.reuseIdentifier,
            for: indexPath
        ) as? CharacterCell else { return UICollectionViewCell() }
        
        cell.nameLabel.text = data[indexPath.row].name
                NetworkManager.shared.getImage(url: data[indexPath.row].image){ image in
            cell.imageView.image = image
        }
        cell.characterTapped = {
            self.goToCharacterPage(id: indexPath.row)
        }
        return cell
    }
    
    func getLoadingCell(collectionView: UICollectionView, indexPath: IndexPath)-> UICollectionViewCell{
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: LoadingCell.reuseIdentifier,
            for: indexPath
        ) as? LoadingCell else { return UICollectionViewCell() }
        
        return cell
    }
    func goToCharacterPage(id:Int){
        let character = data[id]
        print(character.name)
        let secondViewController = CharacterViewControllerAssembly().create(character: character)
        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.modalTransitionStyle = .flipHorizontal
        present(secondViewController,animated: true,completion: nil)
        
    }




}

extension MainViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height
            let visibleHeight = scrollView.bounds.size.height

        
            if offsetY > contentHeight - visibleHeight {
                loadMoreDataIfNeeded()
            }
        }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if data.count == 0{
            return 10
        }
        else{
            return data.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if data.count == 0{
            return getLoadingCell(collectionView: mainView.collectionView, indexPath: indexPath)
        }
        else{
            return getCharacterCell(collectionView: mainView.collectionView, indexPath: indexPath)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Выбран элемент: \(indexPath.item)")
        
        // Здесь можете выполнить дополнительные действия при выборе элемента, такие как переход на другой экран
    }

    
}



    

    

