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
        
        
        let infoLabel = UILabel(frame: CGRect(x: 100, y: 150, width: 200, height: 50))
        infoLabel.textColor = .black
        view.addSubview(infoLabel)
        infoLabel.text = ""
        infoLabel.backgroundColor = .purple
        
        
        
        if let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") {

            // Вызываем URLSession.shared, создаем для сессии DataTask
            let task = URLSession.shared.dataTask(with: url) { data, response, error in

                if let unwrappedData = data {
                    do {
                        let serializedDictionary = try JSONSerialization.jsonObject(with: unwrappedData, options: [])

                        print(serializedDictionary)

                        // Приводим serializedDictionary к [String: Any]
                        if let dict = serializedDictionary as? [String: Any],

                           // Приводим поле title к типу String
                           let title = dict["title"] as? String {
                            DispatchQueue.main.async {
                            infoLabel.text = title
                            
                            print(infoLabel.text ?? "")
                            }
                        }
                    }
                    catch let error {
                        print(error.localizedDescription)
                    }
                }
            }
                task.resume()

        }
        
       
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

