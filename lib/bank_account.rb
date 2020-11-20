class BankAccount
    attr_reader :name
    attr_accessor :balance, :status
    @@all = []

    def initialize (name, balance=1000, status="open")
        @name = name
        @balance = balance
        @status = status
        @@all << self
    end

    def self.all
        @@all
    end

    def deposit(deposit_amount)
        self.balance += deposit_amount
    end

    def display_balance
        return "Your balance is $#{self.balance}."
        #self.balance
    end

    def valid?
        status ==  "open" && balance > 0
    end

    def close_account
        self.status = "closed"
    end
end




