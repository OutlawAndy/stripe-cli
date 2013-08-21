module Stripe
  module CLI
    module Commands
      autoload :Charges, 'stripe/cli/commands/charges'
      autoload :Customers, 'stripe/cli/commands/customers'
      autoload :Plans, 'stripe/cli/commands/plans'
      autoload :Coupons, 'stripe/cli/commands/coupons'
      autoload :Events, 'stripe/cli/commands/events'
      autoload :Invoices, 'stripe/cli/commands/invoices'
      autoload :BalanceTransactions, 'stripe/cli/commands/balance_transactions'
    end
  end
end