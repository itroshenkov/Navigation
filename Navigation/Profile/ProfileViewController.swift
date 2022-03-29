
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
        self.tablePosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifire, for: indexPath) as! PostTableViewCell
        cell.configSetsell(post: tablePosts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.identifire)
        return header
    }
    
}
