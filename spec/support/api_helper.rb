module ApiHelper
  def authenticated_header(headers)
    Devise::JWT::TestHelpers.auth_headers( headers, create( :user))
  end
end