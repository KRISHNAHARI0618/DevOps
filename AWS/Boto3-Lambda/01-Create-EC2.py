import boto3

def create_ec2_instances():
    # Initialize the EC2 client
    ec2 = boto3.client('ec2')

    # Specify the parameters for the instances
    instance_params = {
        'ImageId': 'your_image_id',  # Replace with your desired AMI ID
        'InstanceType': 't2.micro',  # Replace with your desired instance type
        'KeyName': 'your_key_pair',  # Replace with your key pair name
        'MinCount': 1,
        'MaxCount': 10,  # Create 10 instances
        'SecurityGroupIds': ['your_security_group'],  # Replace with your security group ID
        'SubnetId': 'your_subnet_id',  # Replace with your subnet ID
        # Add any additional parameters you require (e.g., UserData, BlockDeviceMappings)
    }

    # Create the instances
    response = ec2.run_instances(**instance_params)

    # Print information about the created instances
    for instance in response['Instances']:
        print(f"Created instance: {instance['InstanceId']}")

# Execute the function to create instances
create_ec2_instances()
