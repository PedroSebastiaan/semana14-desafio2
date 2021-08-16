OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '200561268718503', '2641a290323a12fc52f814bb492092e5'
end