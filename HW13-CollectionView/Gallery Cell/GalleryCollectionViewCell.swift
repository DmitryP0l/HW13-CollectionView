//
//  GalleryCollectionViewCell.swift
//  HW13-CollectionView
//
//  Created by lion on 3.11.21.
//

import UIKit

final class GalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoView: UIImageView!
    
    
    static let identifier = "GalleryCollectionViewCell"
  
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupWithPhoto(photoNameString: String) {
        photoView.image = UIImage(named: photoNameString)
    }
}
