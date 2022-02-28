import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        
        let buttonAlert = UIButton(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
        buttonAlert.setTitle("Alert", for: .normal)
        buttonAlert.addTarget(self, action: #selector(tap2), for: .touchUpInside)
        view.addSubview(buttonAlert)
        buttonAlert.backgroundColor = .red
        
    }
    
    @objc func tap2(){
        let alertVc = UIAlertController(title: "error", message: "Нужно что то сделать", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default){(ok) in
            print("OK")
        }
        alertVc.addAction(ok)
        
        let cencel = UIAlertAction(title: "cencel", style: .cancel){(cencel) in
            print("Cencel")
        }
        alertVc.addAction(cencel)
        
        self.present(alertVc, animated: true, completion: nil)
        
    
    }
}

