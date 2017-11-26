class V1 < Grape::API
  version 'v1'
  format :json
  prefix :api

  mount Item

  add_swagger_documentation(
  info: {
    title: 'Picol API',
    version: 'v1',
    description: 'ほげほげ'
  },
  api_version: 'v1',
  format: :json,
  hide_documentation_path: true,
  token_owner: 'resource_owner',
  models: [
  ],
  authorizations: {
    oauth2: {
      type: 'oauth2',
      in: 'header',
      scopes: [
        { scope: 'public', description: 'Permission to READ your own data' },
        { scope: 'write', description: 'Permission to WRITE your data' }
      ],
      flow: 'accessCode',
      authorizationUrl: '/oauth/authorize',
      tokenUrl: '/oauth/token'
    }
  }
)
end
