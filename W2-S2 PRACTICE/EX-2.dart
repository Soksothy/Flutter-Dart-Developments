class BankAccount {
  final int id;
  final String owner;
  double _balance = 0;

  BankAccount(this.id, this.owner);

  double get balance => _balance;

  void withdraw(double amount) {
    if (_balance - amount < 0) {
      throw Exception('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }

  void credit(double amount) {
    _balance += amount;
  }
}

class Bank {
  final String name;
  final Map<int, BankAccount> _accounts = {};

  Bank({required this.name});

  BankAccount createAccount(int accountId, String accountOwner) {
    if (_accounts.containsKey(accountId)) {
      throw Exception('Account with ID $accountId already exists!');
    }
    final account = BankAccount(accountId, accountOwner);
    _accounts[accountId] = account;
    return account;
  }
}
 
void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance);
  ronanAccount.credit(100);
  print(ronanAccount.balance);
  ronanAccount.withdraw(50);
  print(ronanAccount.balance);

  try {
    ronanAccount.withdraw(75);
  } catch (e) {
    print(e);
  }

  try {
    myBank.createAccount(100, 'Honlgy');
  } catch (e) {
    print(e);
  }
}