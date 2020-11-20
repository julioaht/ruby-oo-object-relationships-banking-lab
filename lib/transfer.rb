class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  @@all = []

  def initialize(sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver 
    @status = "pending" ##why????
    @amount = amount
    @@all << self
  
  end

  def self.all
    @@all
  end

  def valid? ##askk
    # receiver.status == "pending" && sender.status == "pending"
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending" 
      sender.balance -= amount 
      receiver.balance += amount
      self.status = "complete"
    else transfer_rejected 
    end
  end
  
  def transfer_rejected
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end

  end
  
end


