import UIKit

//Цель. Научится самому работать со структурами и классами
//Задача.
//Создает объект класса Bank и добавляет несколько счетов.
//Выполняет операции пополнения счета и перевода средств между счетами.
//Печатает состояние всех счетов до и после выполнения операций.
//Результат. Консольная программа

// MARK: - Person
final class Person {
    
    let name: String
    var accounts: [BankAccount]
    
    init(name: String) {
        self.name = name
        self.accounts = []
    }
    
    func createAccount(bank: Bank) {
        let account = bank.registerAccount(person: self)
        
        accounts.append(account)
    }
}

// MARK: - Bank Account
final class BankAccount {
    
    let accountNumber = UUID()
    var balance: Double
    
    weak var person: Person?
    weak var bank: Bank?
    
    init(
        balance: Double,
        bank: Bank,
        person: Person
    ) {
        self.balance = balance
        self.bank = bank
        self.person = person
    }
    
    func makeTransfer(to receiver: BankAccount, amount: Double) {
        bank?.makeMoneyTransfer(bill: .init(sender: self, receiver: receiver, amount: amount))
    }
    
    func makeTopUp(amount: Double) {
        bank?.makeAccountTopUp(accountNumber: accountNumber, amount: amount)
    }
}

// MARK: - Bill
final class Bill {
    
    var sender: BankAccount
    var receiver: BankAccount
    var amount: Double
    
    init(
        sender: BankAccount,
        receiver: BankAccount,
        amount: Double
    ) {
        self.sender = sender
        self.receiver = receiver
        self.amount = amount
    }
}

// MARK: - Bank
final class Bank {
    
    private var accounts: [BankAccount]
    
    init() {
        self.accounts = []
    }
    
    // MARK: - Public methods
    func registerAccount(person: Person) -> BankAccount {
        let account: BankAccount = .init(balance: .zero, bank: self, person: person)
        
        accounts.append(account)
        
        return account
    }
    
    func makeAccountTopUp(accountNumber: UUID, amount: Double) {
        guard let account = findAccountInBank(by: accountNumber) else {
            print("Счет №\(accountNumber) не найден.")
            return
        }
        
        if amount > .zero {
            print("Текущий баланс счета №\(accountNumber): \(account.balance)$")
            
            account.balance += amount
            
            print("Операция прошла успешно. Текущий баланс счета №\(accountNumber): \(account.balance)$")
        } else {
            print("Некорректная сумма пополнения.")
        }
    }
    
    func makeMoneyTransfer(bill: Bill) {
        let sender = bill.sender
        let receiver = bill.receiver
        
        guard let senderAccount = findAccountInBank(by: sender.accountNumber) else {
            print("Счет отправителя №\(sender.accountNumber) не найден.")
            return
        }
        
        guard (receiver.bank?.findAccountInBank(by: receiver.accountNumber) != nil) else {
            print("Счет получателя №\(receiver.accountNumber) не найден в банке получателя.")
            return
        }
        
        sender.bank === receiver.bank
        ? makeIntrabankTransfer(with: bill)
        : makeExternalTransfer(with: bill)
    }
    
    // MARK: - Private methods
    private func makeExternalTransfer(with bill: Bill) {
        let sender = bill.sender
        let receiver = bill.receiver
        let amount = bill.amount
        
        if let senderBank = sender.bank,
           senderBank.makeAccountWithdrawal(accountNumber: sender.accountNumber, amount: amount) {
            receiver.bank?.makeAccountTopUp(accountNumber: receiver.accountNumber, amount: amount)
        }
    }
    
    private func makeIntrabankTransfer(with bill: Bill) {
        let sender = bill.sender
        let receiver = bill.receiver
        let amount = bill.amount
        
        if makeAccountWithdrawal(accountNumber: sender.accountNumber, amount: amount) {
            receiver.bank?.makeAccountTopUp(accountNumber: receiver.accountNumber, amount: amount)
        }
    }
    
    private func makeAccountWithdrawal(accountNumber: UUID, amount: Double) -> Bool {
        guard let account = findAccountInBank(by: accountNumber) else {
            print("Счет №\(accountNumber) не найден.")
            return false
        }
        
        if amount > .zero && account.balance >= amount {
            print("Текущий баланс счета №\(accountNumber): \(account.balance)$")
            
            account.balance -= amount
            
            print("Операция прошла успешно. Текущий баланс счета №\(accountNumber): \(account.balance)$")
            
            return true
        } else {
            print(
                 """
                 На счете №\(accountNumber) недостаточно средств для выполнения операции, либо указана неверная сумма.
                 Текущий баланс счета: \(account.balance)$
                 """
            )
            
            return false
        }
    }
    
    private func findAccountInBank(by accountNumber: UUID) -> BankAccount? {
        return accounts.first { $0.accountNumber == accountNumber }
    }
}

// banks
let tBank = Bank()
let vtbBank = Bank()

// persons
let me: Person = .init(name: "Анастасия")
let mom: Person = .init(name: "Елена")
let friend: Person = .init(name: "Матвей")

// create accounts
me.createAccount(bank: tBank)
mom.createAccount(bank: tBank)
friend.createAccount(bank: vtbBank)

// bank accounts
let myFirstBankAccount = me.accounts.first
let momFirstBankAccount = mom.accounts.first
let friendFirstBankAccount = friend.accounts.first

// account top up
me.accounts.first?.makeTopUp(amount: 1000)

// transfer to the same bank
if let momFirstBankAccount = momFirstBankAccount {
    myFirstBankAccount?.makeTransfer(to: momFirstBankAccount, amount: 300)
}

// transfer to another bank
if let friendFirstBankAccount = friendFirstBankAccount {
    myFirstBankAccount?.makeTransfer(to: friendFirstBankAccount, amount: 100)
}
