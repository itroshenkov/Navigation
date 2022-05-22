
import UIKit
import StorageService
class ProfileViewController: UIViewController {
    
    // ДЗ №3
    
    var userService: UserService?
    var nameUser: String
    init(userService: UserService, name: String){
        self.userService = userService
        self.nameUser = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    static var postTable: UITableView = {
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
        
        #if DEBUG
        view.backgroundColor = .green
        #endif
        
        
        
        
        ProfileViewController.postTable.dataSource = self
        ProfileViewController.postTable.delegate = self
        
        ProfileViewController.postTable.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.identifire)
        ProfileViewController.postTable.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifire)
        ProfileViewController.postTable.register(PhotoTableViewCell.self, forCellReuseIdentifier: PhotoTableViewCell.identifire)
        
        view.addSubview(ProfileViewController.postTable)
        setupConstraints()
    }
        
    func setupConstraints(){
        NSLayoutConstraint.activate([
            ProfileViewController.postTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            ProfileViewController.postTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ProfileViewController.postTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ProfileViewController.postTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func freshArrayPosts() {
        ProfileViewController.postTable.reloadData()
        ProfileViewController.postTable.refreshControl?.endRefreshing()
    }



override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
        navigationController?.pushViewController(PhotosViewController(), animated: true)
        }
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
