

import UIKit
import iOSIntPackage
import StorageService

class PhotosCollectionViewCell: UICollectionViewCell{
    
    static let identifire = "PhotosColectionCell"
    
    let photo: UIImageView = {
        let photo = UIImageView()
        photo.autoLayoutOn()
        return photo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(photo)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([photo.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                                     photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     photo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
                                    ])
    }
    
    func setupImage(_ image: UIImage) {
        photo.image = image
    }
    
}



