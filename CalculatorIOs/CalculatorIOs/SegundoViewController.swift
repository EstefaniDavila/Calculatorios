
import UIKit

class SegundoViewController: UIViewController {
    
    @IBOutlet weak var calcFunc: UILabel!
    @IBOutlet weak var calcRpta: UILabel!
    
    @IBOutlet weak var btnSumar: UIButton!
    var workings:String = ""
    var numero1:Double = 0.0
    var numero2:Double = 0.0
    var Simbol:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func clearAll(){
        workings = ""
        calcRpta.text = ""
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
            calcRpta.text = resultString
        }
        else{
            let alert = UIAlertController(title: "Invalid Input", message: "Calculator incapaz de hacer problema matematico", preferredStyle: .alert)
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
        if(char == "e"){
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
    
    func Operacion(num1:String?,simbol:String){
        self.numero1 = Double(num1!)!
        self.Simbol = simbol
        self.calcRpta.text = ""
    }
    
    
    @IBAction func clear(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func back(_ sender: Any) {
        if(!workings.isEmpty){
            
            workings.removeLast()
            calcFunc.text = workings
        }
    }
    
    @IBAction func porcent(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func div(_ sender: Any) {
        addToWorkings(value: "/")
    }
    @IBAction func mult(_ sender: Any) {
        addToWorkings(value: "*")
    }
    @IBAction func men(_ sender: Any) {
        addToWorkings(value: "-")
    }
    @IBAction func suma(_ sender: Any) {
        addToWorkings(value: "+")
    }
    @IBAction func punto(_ sender: Any) {
        addToWorkings(value: ".")
    }
    @IBAction func cero(_ sender: Any) {
        addToWorkings(value: "0")
    }
    @IBAction func uno(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    @IBAction func dos(_ sender: Any) {
        addToWorkings(value: "2")
    }
    @IBAction func tres(_ sender: Any) {
        addToWorkings(value: "3")
    }
    @IBAction func cuatro(_ sender: Any) {
        addToWorkings(value: "4")
    }
    @IBAction func cinco(_ sender: Any) {
        addToWorkings(value: "5")
    }
    @IBAction func seis(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    @IBAction func siete(_ sender: Any) {
        addToWorkings(value: "7")
    }
    @IBAction func ocho(_ sender: Any) {
        addToWorkings(value: "8")
    }
    @IBAction func nueve(_ sender: Any) {
        addToWorkings(value: "9")
    }
    @IBAction func cuadrado(_ sender: Any) {
        addToWorkings(value: "x²")
    }
    
    
    @IBAction func raizcuadrada(_ sender: Any) {
        addToWorkings(value: "√")
    }
    
    @IBAction func pi(_ sender: Any) {
        self.calcFunc.text = "3.1416281"
    }
    
    @IBAction func e(_ sender: Any) {
        self.calcFunc.text = "2.27182818"
    }
    
}
