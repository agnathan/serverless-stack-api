# Region - us-east-1
# User Pool Id - us-east-1_mkDYiv4LI
# User Pool ARN - arn:aws:cognito-idp:us-east-1:034529179006:userpool/us-east-1_mkDYiv4LI
# User Pool App Client Name - notes-app
# User Pool App Client ID - 1bjhep729vajsussq5ji08n2rg
# App Client Domain https://notes-app-dwh.auth.us-east-1.amazoncognito.com
# Identity Pool ID - us-east-1:b7523cee-e320-4e11-983e-25cc6ff37735
# API Gateway - https://odf8otnpwa.execute-api.us-east-1.amazonaws.com/prod/
# S3 Bucket Name - notes-app-upload-fullstack


# Stripe Configuration 
# Publishable key - pk_test_4HhmqYd9HiWZh4a9b0Zs6bHM004mv6EUeH
# Secret key - sk_test_3FMZqXJVkjz4F3FBgG0deNN500aviyhCmQ




# serverless deploy
# Serverless: Stack update finished...
# Service Information
# service: notes-api
# stage: prod
# region: us-east-1
# stack: notes-api-prod
# resources: 32
# api keys:
#   None
# endpoints:
#   POST - https://odf8otnpwa.execute-api.us-east-1.amazonaws.com/prod/notes
#   GET - https://odf8otnpwa.execute-api.us-east-1.amazonaws.com/prod/notes/{id}
#   GET - https://odf8otnpwa.execute-api.us-east-1.amazonaws.com/prod/notes
#   PUT - https://odf8otnpwa.execute-api.us-east-1.amazonaws.com/prod/notes/{id}
#   DELETE - https://odf8otnpwa.execute-api.us-east-1.amazonaws.com/prod/notes/{id}
# functions:
#   create: notes-api-prod-create
#   get: notes-api-prod-get
#   list: notes-api-prod-list
#   update: notes-api-prod-update
#   delete: notes-api-prod-delete
# layers:
#   None



aws cognito-idp sign-up \
  --region us-east-1 \
  --client-id 1bjhep729vajsussq5ji08n2rg \
  --username daniel.holmlund@aaloncapital.com \
  --password i3,fye8aA

# {
#     "UserConfirmed": false,
#     "CodeDeliveryDetails": {
#         "Destination": "d***@a***.com",
#         "DeliveryMedium": "EMAIL",
#         "AttributeName": "email"
#     },
#     "UserSub": "58437651-70fe-4e31-a9d6-7af67349bca2"
# }

aws cognito-idp admin-confirm-sign-up \
  --region us-east-1 \
  --user-pool-id us-east-1_mkDYiv4LI \
  --username daniel.holmlund@aaloncapital.com


# Test the authenticated API
 npx aws-api-gateway-cli-test \
--username='daniel.holmlund@aaloncapital.com' \
--password='i3,fye8aA' \
--user-pool-id='us-east-1_mkDYiv4LI' \
--app-client-id='1bjhep729vajsussq5ji08n2rg' \
--cognito-region='us-east-1' \
--identity-pool-id='us-east-1:b7523cee-e320-4e11-983e-25cc6ff37735' \
--invoke-url='https://odf8otnpwa.execute-api.us-east-1.amazonaws.com/prod' \
--api-gateway-region='us-east-1' \
--path-template='/notes' \
--method='POST' \
--body='{"content":"hello world","attachment":"hello.jpg"}'

# {
#   status: 200,
#   statusText: 'OK',
#   data: {
#     userId: 'us-east-1:abf4407f-3203-4aa4-9a94-c7cf49971d36',
#     noteId: 'ea875d50-30d1-11eb-8dc2-39109eaa4556',
#     content: 'hello world',
#     attachment: 'hello.jpg',
#     createdAt: 1606496370598
#   }
# }