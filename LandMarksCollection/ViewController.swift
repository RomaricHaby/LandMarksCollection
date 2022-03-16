//
//  ViewController.swift
//  LandMarksCollection
//
//  Created by lpiem on 09/03/2022.
//

import UIKit

class ViewController: UICollectionViewController {
    
    
    enum Section : CaseIterable{
        case largeCell
        case mountains
        case lakes
        case rivers
    }
    
    enum Item : Hashable{
        case  largeCell(LandMark)
        case smallCell(LandMark)
    }
    
    var diffableDataSource : UICollectionViewDiffableDataSource<Section, Item>!

    override func viewDidLoad() {
        super.viewDidLoad()
        DataModel.sharedInstance.loadChecklist()
        
        
        configureDataSource()
        collectionView.collectionViewLayout = createLayout()
        loadInitialState()
    }
    
    private func configureDataSource(){
        diffableDataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            switch itemIdentifier{
            case .largeCell(let landMark) :
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "landMarkLarge", for: indexPath) as! LargeCell
                cell.titleLandMark.text = landMark.name
                cell.imageLandMark.image = landMark.image
                return cell
                
            case .smallCell(let landMark):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "landMarkSmall", for: indexPath) as! SmallCell
                cell.titleLandMark.text = landMark.name
                cell.imageLandMark.image = landMark.image
                return cell
            }
        })
        
        
        /*diffableDataSource.supplementaryViewProvider = { collectionView, elementKind, indexPath in
            switch elementKind{
            case UICollectionView.elementKindSectionHeader:
                let header = coll
            }
        }*/
    }
    
    private func createSnapshot() -> NSDiffableDataSourceSnapshot<Section, Item>{
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.largeCell, .mountains,.lakes,.rivers])
        
        
        Section.allCases.forEach { section in
            switch section{
            case .largeCell:
                let item = DataModel.sharedInstance.getFavLandMarks().map { LandMarks in
                    return Item.largeCell(LandMarks)
                }
                snapshot.appendItems(item, toSection: section)
                
            case .mountains:
                let item = DataModel.sharedInstance.getLandMarksMountains().map { LandMarks in
                    return Item.smallCell(LandMarks)
                }
                snapshot.appendItems(item, toSection: section)
           
            case .lakes:
                let item = DataModel.sharedInstance.getLandMarksLakes().map { LandMarks in
                    return Item.smallCell(LandMarks)
                }
                snapshot.appendItems(item, toSection: section)
            case .rivers:
                let item = DataModel.sharedInstance.getLandMarksRivers().map { LandMarks in
                    return Item.smallCell(LandMarks)
                }
                snapshot.appendItems(item, toSection: section)
            }
        }
        return snapshot
    }
    
    private func loadInitialState(){
        let snapshot = createSnapshot()
        diffableDataSource.apply(snapshot)
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout{
        let layout = UICollectionViewCompositionalLayout{ [weak self] sectionIndex, collectionViewLayoutEnviroment in
            guard let self = self,
                  let section = self.diffableDataSource.sectionIdentifier(for: sectionIndex) else{
                      return nil
                  }
            
            switch section {
            case .largeCell:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
                
                let section = NSCollectionLayoutSection(group: group)
             
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                
                return section

            case .lakes, .rivers, .mountains:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/4), heightDimension: .absolute(110))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                section.contentInsets = .init(top: 25, leading: 10, bottom: 0, trailing: 0)
                section.interGroupSpacing = 15
                
                return section
          
            }
        }
        return layout
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showDetailLandMark"){
            if let destination = segue.destination as? DetailLandMarkViewController{
                
                guard let indexPath = collectionView.indexPath(for: sender as! UICollectionViewCell), let section = diffableDataSource.sectionIdentifier(for: indexPath.section) else {
                          return
                        }
                
                switch section{
                    case Section.mountains :
                    destination.landmark = DataModel.sharedInstance.getLandMarksMountains()[collectionView.indexPath(for: sender as! UICollectionViewCell)!.row]
                    break
                    
                case Section.rivers :
                    destination.landmark = DataModel.sharedInstance.getLandMarksRivers()[collectionView.indexPath(for: sender as! UICollectionViewCell)!.row]
                break
                    
                case Section.lakes :
                    destination.landmark = DataModel.sharedInstance.getLandMarksLakes()[collectionView.indexPath(for: sender as! UICollectionViewCell)!.row]
                break
                    
            
                case .largeCell:
                    destination.landmark = DataModel.sharedInstance.getFavLandMarks()[collectionView.indexPath(for: sender as! UICollectionViewCell)!.row]
                }
                
            }
        }
    }
    

}

