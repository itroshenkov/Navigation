import UIKit


class PhotoTableViewCell: UITableViewCell {
    
    static let identifire = "PhotoTableViewCell"

    var photosLabel: UILabel = {
    let photosLabel = UILabel()
    photosLabel.autoLayoutOn()
    photosLabel.numberOfLines = 1
    photosLabel.text = "Photos"
    photosLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    photosLabel.textColor = .black
    return photosLabel
    }()

    let arrowButton: UIImageView = {
        let arrowButton = UIImageView()
        arrowButton.image = UIImage(systemName: "arrow.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))?.withTintColor(.black, renderingMode: .alwaysOriginal)
        arrowButton.autoLayoutOn()
        return arrowButton
        }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            contentView.addSubviews(photosLabel,arrowButton)
            setupConstraints()
    }
    
        func setupConstraints(){
             NSLayoutConstraint.activate([
             photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
             photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
             arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
             arrowButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
             arrowButton.heightAnchor.constraint(equalToConstant: 30),
             arrowButton.widthAnchor.constraint(equalToConstant: 30),
             
             
             ])
        }
    required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }
    
}
