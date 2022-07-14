

import UIKit

class PrimerViewController: UIViewController {

    @IBOutlet weak var calcResl: UILabel!
    @IBOutlet weak var calcFunc: UILabel!
    
    var workings:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll(){
        workings = ""
        calcResl.text = ""
        calcFunc.text = ""
    }
    
    func addToWorkings(value: String){
        workings = workings + value
        calcFunc.text = workings
    }
    
    @IBAction func igualTap(_ sender: Any) {
        if(validInput()){
            
                let checkedWorkingForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
                let expression = NSExpression(format: checkedWorkingForPercent)
                let resultado = expression.expressionValue(with: nil, context: nil) as! Double
                let resultString = formatResult(result: resultado)
                calcResl.text = resultString
        }
        else{
            let alert = UIAlertController(title: "Ingreso incorrecto", message: "calduladora incapaz de resolver este problema matematico, por favor vuelve a escribir tu operación", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool{
        
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings{
            if(specialCharacter(char: char)){
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes {
            if(index == 0){
                return false
            }
            if(index == workings.count - 1){
                return false
            }
            if(previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        return true
    }
    
    func specialCharacter (char: Character) -> Bool{
        if(char == "*"){
            return true
        }
        if(char == "/"){
            return true
        }
        if(char == "+"){
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String{
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }
        else{
            return String(format: "%.2f", result)
        }
    }
    
    
    @IBAction func allClear(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func backTap(_ sender: Any) {
        if(!workings.isEmpty){
            
            workings.removeLast()
            calcFunc.text = workings
        }
    }
    
    @IBAction func porcentTap(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func divTap(_ sender: Any) {
        addToWorkings(value: "/")
    }
    
    @IBAction func multTap(_ sender: Any) {
        addToWorkings(value: "*")
    }
    
    @IBAction func minusTap(_ sender: Any) {
        addToWorkings(value: "-")

    }
    @IBAction func plusTap(_ sender: Any) {
        addToWorkings(value: "+")

    }
    @IBAction func decimalTap(_ sender: Any) {
        addToWorkings(value: ".")
    }
    
    @IBAction func ceroTap(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    @IBAction func unoTap(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    @IBAction func dosTap(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    @IBAction func tresTap(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    @IBAction func cuatroTap(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    @IBAction func cincoTap(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    @IBAction func seisTap(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    @IBAction func sieteTap(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    @IBAction func ochoTap(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    @IBAction func nueveTap(_ sender: Any) {
        addToWorkings(value: "9")
    }
    
}
