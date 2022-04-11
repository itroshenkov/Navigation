
import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let identifire = "PostTableViewCell"
    
    var postTitle: UILabel = {
        let postTitle = UILabel()
        postTitle.autoLayoutOn()
        postTitle.numberOfLines = 2
        postTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        postTitle.textColor = .black
        return postTitle
    }()
    
    var postImage: UIImageView = {
        let postImage = UIImageView()
        postImage.autoLayoutOn()
        postImage.backgroundColor = .black
        postImage.contentMode = .scaleAspectFit
        return postImage
    }()
    
    var postDescription: UILabel = {
        let postDescription = UILabel()
        postDescription.autoLayoutOn()
        postDescription.numberOfLines = 0
        postDescription.font = UIFont.systemFont(ofSize: 14)
        postDescription.textColor = .systemGray
        return postDescription
    }()
    
    var postLikes: UILabel = {
        let postLikes = UILabel()
        postLikes.autoLayoutOn()
        postLikes.font = UIFont.systemFont(ofSize: 16)
        postLikes.textColor = .black
        return postLikes
    }()
    
    var postViews: UILabel = {
        let postViews = UILabel()
        postViews.autoLayoutOn()
        postViews.font = UIFont.systemFont(ofSize: 16)
        postViews.textColor = .black
        return postViews
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(postTitle, postImage, postDescription, postLikes, postViews)
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            postTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.indent),
            postTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leading),
            postTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailing),
            
            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.topAnchor.constraint(equalTo: postTitle.bottomAnchor, constant: Const.indent),
            
            postDescription.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: Const.indent),
            postDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -48),
            postDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leading),
            postDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailing),
            
            postLikes.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: Const.indent),
            postLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leading),
            postLikes.heightAnchor.constraint(equalToConstant: Const.indent),
            
            postViews.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: Const.indent),
            postViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailing),
            postLikes.heightAnchor.constraint(equalToConstant: Const.indent)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configSetsell(post: Post) {
        postTitle.text = post.title
        postImage.image = UIImage(named: post.image)
        postDescription.text = post.description
        postLikes.text = "Лайк: \(post.likes)"
        postViews.text = "Просмотры: \(post.views)"
    }
}
