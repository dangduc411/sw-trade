class BuyerMailer < ActionMailer::Base
	default :from => "acc-game@hte.vn"
	def sent_account(account)
		@account = account
		mail :to => account.payer_email, :subject => "Your Account"
	end
end
