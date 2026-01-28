class CurrentUser < ActiveSupport::CurrentAttributes
  attribute :user, :safe_mode, :save_data, :request

  alias_method :safe_mode?, :safe_mode
  delegate :id, to: :user, allow_nil: true
  delegate_missing_to :user

  # Run a block of code as another user.
  # @param user [User] the user to run as
  # @param ip_addr [String] the IP address to run as
  # @yield the block
  def self.scoped(user, ip_addr = "127.0.0.1", &block)
    set(user: user) do
      yield user
    end
  end
end
