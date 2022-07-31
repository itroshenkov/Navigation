import UIKit

class InfoViewController: UIViewController {
    
    // iosdt1.2_Задача 2
    public var planet: PlanetModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        let buttonAlert = UIButton(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
        buttonAlert.setTitle("Alert", for: .normal)
        buttonAlert.addTarget(self, action: #selector(tap2), for: .touchUpInside)
        view.addSubview(buttonAlert)
        buttonAlert.backgroundColor = .red
        
        // iosdt1.2_Задача 1
        let infoLabel = UILabel(frame: CGRect(x: 100, y: 150, width: 200, height: 50))
        infoLabel.textColor = .black
        view.addSubview(infoLabel)
        infoLabel.text = ""
        infoLabel.backgroundColor = .purple
        
        // iosdt1.2_Задача 2
        let planetLabel = UILabel(frame: CGRect(x: 100, y: 230, width: 200, height: 50))
        planetLabel.textColor = .black
        view.addSubview(planetLabel)
        planetLabel.text = ""
        planetLabel.backgroundColor = .green
        
        
        // iosdt1.2_Задача 2
        if let url = URL(string: "https://swapi.dev/api/planets/1") {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let unwrappedData = data {
                    do {
                        
                        let planet = try JSONDecoder().decode(PlanetModel.self, from: unwrappedData)
                        
                        print(planet.orbitalPeriod)
                        
                        DispatchQueue.main.async {
                            planetLabel.text = planet.orbitalPeriod
                        }
                        
                    }
                    catch let error {
                        print("⚠️ PLANET ERROR: \(error.localizedDescription)")
                    }
                }
            }
            task.resume()
        }
        
        
        // iosdt1.2_Задача 1
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
        let alertVc = UIAlertController(title: "error", message: "ОПАСНОСТЬ", preferredStyle: .alert)
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

