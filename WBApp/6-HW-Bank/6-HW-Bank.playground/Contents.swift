import UIKit

// Напишите программу, которая моделирует фабрику по производству строительных материалов.
// Опишите в программе два класса: Человек (ФИО, возраст, паспорт), Паспорт (Серия, Номер, дата выдачи, Человек) и инициализируйте их.
// Создавайте класс Person и Passport + инициализируйте их, потом деинициализируйте чтобы проверить, что все ок. Из памяти они уходят и так далее

// MARK: - Weak
final class Weak<T: AnyObject> {
    
    private weak var value : T?
    
    init(value: T) {
        self.value = value
    }
}

// MARK: - Passport
final class Passport {
    
    let series: Int
    let number: Int
    let dateOfIssue: Date
    
    private weak var owner: Person?
    
    init(
        series: Int,
        number: Int,
        dateOfIssue: Date,
        owner: Person
    ) {
        self.series = series
        self.number = number
        self.dateOfIssue = dateOfIssue
        self.owner = owner
    }
    
    deinit {
        print("Passport \(series)-\(number) deinit")
    }
}

// MARK: - Person
final class Person {
    
    var fullName: String
    var age: Int
    var passport: Passport?
    var factoryJob: Factory?
    
    init(
        fullName: String,
        age: Int,
        passport: Passport? = nil,
        factoryJob: Factory? = nil
    ) {
        self.fullName = fullName
        self.age = age
        self.passport = passport
        self.factoryJob = factoryJob
    }
    
    deinit {
        print("\(fullName) deinit")
    }
}

// MARK: - Material
class Material {
    
    let id = UUID()
    let name: String
    var amount: Int
    
    init(
        name: String,
        amount: Int
    ) {
        self.name = name
        self.amount = amount
    }
}

// MARK: - Cement
final class Cement: Material {
    
    override init(name: String, amount: Int = .zero) {
        super.init(name: name, amount: amount)
    }
}

// MARK: - Sand
final class Sand: Material {
    
    override init(name: String, amount: Int = .zero) {
        super.init(name: name, amount: amount)
    }
}

// MARK: - Plaster
final class Plaster {
    
    let id = UUID()
    var amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
}

// MARK: - Factory
final class Factory {
    
    private var workers: [Weak<Person>] = []
    
    private var materialsManager: MaterialsManager
    
    init(materialsManager: MaterialsManager) {
        self.materialsManager = materialsManager
    }
    
    func hire(_ worker: Person) {
        let weakWorker = Weak(value: worker)
        
        workers.append(weakWorker)
        
        worker.factoryJob = self
    }
    
    func makePlaster(
        worker: Person,
        sand: Sand,
        cement: Cement,
        amount: Int
    ) -> Plaster? {
        let sandAmountForPlaster = 4 * amount
        let cementAmountForPlaster = 1 * amount
        
        guard let sand = materialsManager.searchMaterial(with: sand.id),
              let cement = materialsManager.searchMaterial(with: cement.id),
              sand.amount >= sandAmountForPlaster,
              cement.amount >= cementAmountForPlaster
        else {
            print("\(sand.name) or \(cement.name) not enough.")
            return nil
        }
        
        materialsManager.declareMaterialConsumption(material: sand, amount: sandAmountForPlaster)
        materialsManager.declareMaterialConsumption(material: cement, amount: cementAmountForPlaster)
        
        print("\(worker.fullName) is making plaster.")
        
        print("Plaster was made")
        return Plaster(amount: amount)
    }
    
    deinit {
        print("Factory deinit")
    }
}

// MARK: - MaterialsManager
final class MaterialsManager {
    
    private var materials: [Material] = []
    
    // MARK: - Public methods
    func searchMaterial(with id: UUID) -> Material? {
        return materials.first(where: { $0.id == id })
    }
    
    func declareMaterialDelivery(material: Material, amount: Int) {
        if let material = materials.first(where: { $0.id == material.id }) {
            print("\(material.amount) \(material.name) in stock.")
            
            material.amount += amount
            
            print("\(material.amount) \(material.name) in stock.")
        } else {
            materials.append(material)
            material.amount += amount
            
            print("\(material.amount) \(material.name) was added to the stock.")
        }
    }
    
    func declareMaterialConsumption(material: Material, amount: Int) {
        guard let material = materials.first(where: { $0.id == material.id }) else {
            print("Material \(material.name) not found.")
            return
        }
        
        print("\(material.amount) \(material.name) in stock.")
        
        if amount <= material.amount {
            material.amount -= amount
            print("\(amount) units of \(material.name) consumed. New total amount: \(material.amount)")
        } else {
            print("Not enough \(material.name) to consume. Current amount: \(material.amount)")
        }
        
        clearMaterialIfNeeded(material: material)
    }
    
    // MARK: - Private methods
    private func clearMaterialIfNeeded(material: Material) {
        if material.amount == .zero {
            materials.removeAll(where: { $0.id == material.id })
        }
    }
}

// MARK: - Examples

// make factory manager
let braerMaterialsManager = MaterialsManager()

// make factory
var braerFactory: Factory? = Factory(materialsManager: braerMaterialsManager)

// make person
var maryJoe: Person? = Person(
    fullName: "Mary Joe",
    age: 22
)

// make passport
var maryJoePassport: Passport? = Passport(
    series: 5010,
    number: 282891,
    dateOfIssue: Date(),
    owner: maryJoe ?? Person(fullName: "", age: 20)
)

maryJoe?.passport = maryJoePassport

// hire worker
//braerFactory?.hire(maryJoe ?? Person(fullName: "", age: 20))

// make materials
//let sand = Sand(name: "Dry sand")
//let cement = Cement(name: "Dry cement")

// materials arrival
//braerMaterialsManager.declareMaterialDelivery(material: sand, amount: 300)
//braerMaterialsManager.declareMaterialDelivery(material: cement, amount: 100)

// make plaster from sand and cement
//braerFactory?.makePlaster(worker: maryJoe ?? Person(fullName: "", age: 20), sand: sand, cement: cement, amount: 1)

// check deinit
//maryJoe = nil
//braerFactory = nil
//maryJoePassport = nil
