//
//  ViewController.swift
//  HW13-CollectionView
//
//  Created by lion on 2.11.21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    private var pressedBool: Bool = true
    @IBAction func changeButton(_ sender: UIButton) {
        pressedBool.toggle()
        collectionView.reloadData()
    }
    
    private var dataSource: [String] = ["img_1", "img_2", "img_3", "img_4", "img_5", "img_6","img_7", "img_8", "img_9", "img_10", "img_11", "img_12", "img_13", "img_14", "img_15", "img_16", "img_17", "img_18", "img_19", "img_20"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "GalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier)
        
    }
    
    
    

}



extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = GaleryViewController()
        present(controller, animated: true, completion: nil)
        controller.setupWith(photos: dataSource, selectedPhotoName: dataSource[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identifier, for: indexPath) as! GalleryCollectionViewCell
        cell.setupWithPhoto(photoNameString: dataSource[indexPath.row])
        return cell
    }
   
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if pressedBool == true {
        let size = CGFloat(collectionView.frame.width / 3.2)
            return CGSize(width: size, height: size)
        } else {
            let size = CGFloat(collectionView.frame.width)
            return CGSize(width: size, height: size)
        }
    }
    
   
    
    
}
