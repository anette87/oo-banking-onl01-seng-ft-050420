require "pry"

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

    def initialize(sender, receiver, amount) #to initialize you need to add all of them to attr_accessor
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
  end

    def valid?
      @sender.valid? && @receiver.valid?
    end 
    
    def execute_transaction
      if @sender.balance >= @amount && valid? && @status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      else
        @status = "rejected" 
        return "Transaction rejected. Please check your account balance."
      end
    end
  
    def reverse_transfer
      if @status == "complete"
        @sender.balance += @amount
        @receiver.balance -= @amount
        @status = "reversed"
      end
    end
  end
