# Boto 3 AWS Infrastruture Creature
# Boto3 Collections
'''
resource object  and client

'''
from urllib import response
import boto3

client_ec2 = boto3.client('ec2')
# responce = client_ec2.run_instances(ImageId='ami-0759f51a90924c166',
#                         InstanceType = 't2.micro',
#                         MinCount = 1,
#                         MaxCount = 1)

# for instance in responce['Instances']:
#   print(instance['InstanceId'])

respnce  = client_ec2.terminate_instances(InstanceIds=['i-0c27a559ddac2a145','i-001ca37ffd237c1d3'])
responses = client_ec2.describe_instances()
for reservation in responses['Reservations']:
  for instance in reservation['Instances']:
    print(instance['InstanceId'])
# print(responses)
# i-0c27a559ddac2a145
# i-001ca37ffd237c1d3
