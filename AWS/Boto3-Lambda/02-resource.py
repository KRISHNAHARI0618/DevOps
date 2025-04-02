import boto3
ec2 = boto3.resource('ec2')
sns_client = boto3.client('sns')


# print(ec2.instance)
for instance in ec2.instances.all():
  print(instance)
  print(instance.state)
