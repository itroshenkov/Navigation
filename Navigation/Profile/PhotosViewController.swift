

import UIKit
//import StorageService

import iOSIntPackage

class PhotosViewController: UIViewController{
    
    let facade = ImagePublisherFacade()
    
    let facade = ImagePublisherFacade()
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.scrollDirection = .vertical
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.autoLayoutOn()
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    
    var contentPhotoData: [UIImage] = [] {
        didSet {
            if contentPhotoData.count == photoCollectionArray.count {
                facade.removeSubscription(for: self)
            }
        }
    }
    
    //Задание №8
    
    var timeCount = 0.0
    var timer: Timer? = nil
    
    var contentPhotoData: [UIImage] = [] {
        didSet {
            if contentPhotoData.count == photoCollectionArray.count {
                facade.removeSubscription(for: self)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Gallery"
        view.backgroundColor = .systemGray2
        view.addSubview(collectionView)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifire)
        setupConstraints()
        facade.subscribe(self)
        facade.addImagesWithTimer(time: 0.5, repeat: photoCollectionArray.count*10, userImages:photoCollectionArray)
        
        //Звдание №8
        let imageProcessor = ImageProcessor()
        imageProcessor.processImagesOnThread(sourceImages: photoCollectionArray, filter: .fade, qos: .default){cgImages in
            let images = cgImages.map({UIImage(cgImage: $0!)})
            self.contentPhotoData.removeAll()
            images.forEach({self.contentPhotoData.append($0)})
            DispatchQueue.main.async{
                self.collectionView.reloadData()
                
            }
        }
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    
    /*
     .Background - 0.47 сек
     .utility - 0.45 сек
     .default - 0.45 сек
     
     */
    
    
    //Задание №8
    @objc func updateTimer() {
        timeCount += 0.01
        if contentPhotoData.count > 0 {
            print("Потрачено \(self.timeCount) секунд")
            timer!.invalidate()
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

    }
}

override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: animated)
}

override func viewWillAppear(_ animated: Bool) {
    navigationController?.navigationBar.isHidden = false
}

func setupConstraints() {
    NSLayoutConstraint.activate([
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
}
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        contentPhotoData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifire, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        cell.setupImage(contentPhotoData[indexPath.item])
        cell.setupImage(contentPhotoData[indexPath.item])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width - 40) / 3, height: (collectionView.frame.width - 40) / 3)
    }
}

extension PhotosViewController: ImageLibrarySubscriber {
    
    func receive(images: [UIImage]) {
        
        images.forEach({ image in
            if contentPhotoData.contains(where: {image == $0}) {
                return
            }
            else {
                contentPhotoData.append(image)
            }
        })
        collectionView.reloadData()
        
    }
}

extension PhotosViewController: ImageLibrarySubscriber {
    
    func receive(images: [UIImage]) {
        
        images.forEach({ image in
            if contentPhotoData.contains(where: {image == $0}) {
                return
            }
            else {
                contentPhotoData.append(image)
            }
        })
        collectionView.reloadData()
        
    }
    
}

