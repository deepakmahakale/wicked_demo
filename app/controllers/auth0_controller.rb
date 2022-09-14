class Auth0Controller < ApplicationController
  def callback
    # OmniAuth stores the information returned from Auth0 and the IdP in request.env['omniauth.auth'].
    # In this code, you will pull the raw_info supplied from the id_token and assign it to the session.
    # Refer to https://github.com/auth0/omniauth-auth0#authentication-hash for complete information on 'omniauth.auth' contents.

    session[:user_id] = request.env['omniauth.auth'][:uid]

    handle_new_user unless User.exists?(auth_user_id: session[:user_id])

    # Redirect to the URL you want after successful auth
    redirect_to '/'
  end

  def failure
    @error_msg = request.params['message']
  end

  def logout
    reset_session
    redirect_to logout_url, allow_other_host: true
  end

  private

  def handle_new_user
    auth_info = request.env['omniauth.auth']
    user_info = auth_info[:info]

    User.create(
      auth_provider_name: auth_info[:provider],
      auth_user_id: auth_info[:uid],
      auth_user_email: user_info[:email],
      first_name: user_info[:first_name],
      last_name: user_info[:last_name]
    )
  end

  def logout_url
    request_params = {
      returnTo: root_url,
      client_id: Rails.application.credentials.dig(:auth0, :client_id)
    }

    URI::HTTPS.build(
      host: Rails.application.credentials.dig(:auth0, :domain),
      path: '/v2/logout',
      query: request_params.to_query
    ).to_s
  end
end
