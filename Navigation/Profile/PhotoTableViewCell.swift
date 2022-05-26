import UIKit
import iOSIntPackage
import StorageService


class PhotoTableViewCell: UITableViewCell {
        static let identifire = "PhotoTableViewCell"
    
        let imageProcessor = ImageProcessor()
    
        var photosLabel: UILabel = {
        let photosLabel = UILabel()
        photosLabel.autoLayoutOn()
        photosLabel.numberOfLines = 1
        photosLabel.text = "Photos"
        photosLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photosLabel.textColor = .black
        return photosLabel
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.autoLayoutOn()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .white
        return stackView
    }()
    
    
    let arrowButton: UIImageView = {
        let arrowButton = UIImageView()
        arrowButton.image = UIImage(systemName: "arrow.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))?.withTintColor(.black, renderingMode: .alwaysOriginal)
        arrowButton.autoLayoutOn()
        return arrowButton
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(photosLabel,arrowButton,stackView)
        setupConstraints()
        for i in 0...3 {
            let photo = UIImageView(image: photoCollectionArray[i])
            photo.autoLayoutOn()
            photo.layer.cornerRadius = 6
            photo.clipsToBounds = true
            photo.contentMode = .scaleAspectFill
            stackView.addArrangedSubview(photo)
        }
    }
    
    
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrowButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            arrowButton.heightAnchor.constraint(equalToConstant: 30),
            arrowButton.widthAnchor.constraint(equalToConstant: 30),
            
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])
        
        //            код не выставляет констрейнты
        //            stackView.arrangedSubviews.forEach({
        //            [$0.widthAnchor.constraint(lessThanOrEqualToConstant: (contentView.frame.width - 16) / 4),
        //            $0.heightAnchor.constraint(equalTo: $0.widthAnchor)].forEach({$0.isActive = true})
        //            })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
