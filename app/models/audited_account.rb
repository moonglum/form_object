class AuditedAccount
  attr_reader :account

  def initialize(account = Account.new)
    @account = account
  end

  def update(params)
    Rails.logger.info "Audit: Updating Account #{@account.id} with name #{params[:name]}"
    @account.update(params)
  end

  def create(params)
    Rails.logger.info "Audit: Creating Account with name #{params[:name]}"
    @account = Account.new(params)
    @account.save
  end

  def destroy
    Rails.logger.info "Audit: Destroying Account #{@account.id}"
    @account.destroy
  end
end
