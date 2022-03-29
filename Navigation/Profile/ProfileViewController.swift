
import UIKit

class ProfileViewController: UIViewController {
    
    var postTable: UITableView = {
        let postTable = UITableView(frame: .zero, style: .grouped)
        postTable.autoLayoutOn()
        postTable.refreshControl = UIRefreshControl()
        postTable.isScrollEnabled = true
        postTable.separatorInset = .zero
        postTable.refreshControl?.addTarget(self, action: #selector(freshArrayPosts), for: .valueChanged)
        postTable.sectionHeaderHeight = UITableView.automaticDimension
        postTable.estimatedSectionHeaderHeight = 220
        postTable.rowHeight = UITableView.automaticDimension
        return postTable
    }()
    
    var tablePosts = arrayPosts

    override func viewDidLoad (){
            super.viewDidLoad()
        view.backgroundColor = .white
            
            postTable.dataSource = self
            postTable.delegate = self
            
            postTable.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.identifire)
            postTable.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifire)
            postTable.register(PhotoTableViewCell.self, forCellReuseIdentifier: PhotoTableViewCell.identifire)
        
            view.addSubview(postTable)
            setupConstraints()
    }
        
      func setupConstraints(){
           NSLayoutConstraint.activate([
           postTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
           postTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
           postTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
           postTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
           ])
      }
        
     @objc func freshArrayPosts() {
            postTable.reloadData()
            postTable.refreshControl?.endRefreshing()
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 1 ? self.tablePosts.count : 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 2
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifire, for: indexPath) as! PostTableViewCell
        cell.configSetsell(post: tablePosts[indexPath.row])
        return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.identifire, for: indexPath) as! PhotoTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
        return 220
        } else
        {return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.identifire)
        return header
        } else { return nil }
    }
}
