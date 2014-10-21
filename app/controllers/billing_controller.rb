class BillingController < ApplicationController
	
	def express_checkout
		account = Account.find(params[:account_id])
	  response = EXPRESS_GATEWAY.setup_purchase(account.price * 10,
	    ip: request.remote_ip,
	    return_url: confirm_buy_url(params[:account_id]), # => /xac_nhan_mua/123?token=lasdkfjsla&payerID=asldkf
	    cancel_return_url: root_url,
	    currency: "USD",
	    allow_guest_checkout: true,
	    items: [{name: "Mua account", description: "Order description", quantity: "1", amount: 1000}]
	  )
	  redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
	end

	def confirm_buy
		@account = Account.find(params[:account_id])
	end

	def buy
		account = Account.find(params[:account_id])
		response = EXPRESS_GATEWAY.purchase(account.price * 100, token: params[:token], payer_id: params[:PayerID])
		account.selled = true
		account.payer_id = params[:PayerID]
		account.save
		redirect_to root_path
	end
=begin
	def thuc_hien_mua
		ip => request.ip,
      :token => express_token,
      :payer_id => express_payer_id
		account = Accoun.find params[:accounti_id]
		response = EXPRESS_GATEWAY.purchase(order.total_amount_cents, express_purchase_options)
		if response.success?
			# payer_id
			# payer_id\p
			# danh dau account da mua
			account.da_mua = true
			account.save
			redirect....
		else
			redirect.... hien thong bao da co loi xay ra .....
		end
	end
=end
end