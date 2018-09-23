require 'spec_helper'

describe Stripe::CLI::Command do

  let(:_id_) { "random-id-string" }



  describe "#find" do
    before do
      Stripe.api_key = 'sk_test_123'
      Stripe.api_base = "http://localhost:#{MOCK_PORT}"
    end
    it "calls super, passing in `Stripe::Charge` and an `id`" do
      # Stripe::Charge.should_receive(:retrieve).with( _id_, "stripe-key" )

      Stripe::CLI::Runner.start ["charges", "find", _id_]
    end

    it "calls super, passing in `Stripe::Plan` and an `id`" do
      # Stripe::Plan.should_receive(:retrieve).with( _id_, "stripe-key" )

      Stripe::CLI::Runner.start ["plans", "find", _id_]
    end

    it "calls super, passing in `Stripe::Invoice` and an `id`" do
      # Stripe::Invoice.should_receive(:retrieve).with( _id_, "stripe-key" )

      Stripe::CLI::Runner.start ["invoices", "find", _id_]
    end

    it "calls super, passing in `Stripe::Coupon` and an `id`" do
      # Stripe::Coupon.should_receive(:retrieve).with( _id_, "stripe-key" )

      Stripe::CLI::Runner.start ["coupons", "find", _id_]
    end

    it "calls super, passing in `Stripe::Customer` and an `id`" do
      # Stripe::Customer.should_receive(:retrieve).with( _id_, "stripe-key" )

      Stripe::CLI::Runner.start ["customers", "find", _id_]
    end

    it "calls super, passing in `Stripe::BalanceTransaction` and an `id`" do
      # Stripe::BalanceTransaction.should_receive(:retrieve).with( _id_, "stripe-key" )

      Stripe::CLI::Runner.start ["transactions", "find", _id_]
    end

  end

end