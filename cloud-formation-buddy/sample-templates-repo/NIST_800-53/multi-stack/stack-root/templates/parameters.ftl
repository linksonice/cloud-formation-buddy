      "pCreateCloudTrail":{
         "Description":"Create new CloudTrail Trail (yes or no), if yes must provide pS3CloudTrailBucketExisting or pS3CloudTrailLocal parameter? 'no' will not setup any CloudTrail logging",
         "Type":"String",
         "Default":"no"
      },
      "pS3CloudTrailBucketExisting":{
         "Description":"Name of EXISTING S3 log bucket for CloudTrail if not creating new",
         "Type":"String",
         "Default":"none"
      },
      "pNotifyEmail":{
         "Description":"Notification email for security events",
         "Type":"String",
         "Default":"distlist@example.org"
      },
      "pS3CloudTrailLocal":{
         "Description":"Name of new local bucket for S3 logging (required)",
         "Type":"String",
         "Default":"none"
      },
      "pKeyName":{
         "Description":"Key Name for Instance",
         "Type":"AWS::EC2::KeyPair::KeyName",
         "Default":""
      },
      "pNatInstanceType":{
         "Description":"Nat EC2 instance type",
         "Type":"String",
         "Default":"t1.micro",
         "AllowedValues":[
            "t1.micro",
            "t2.micro",
            "t2.small",
            "t2.medium",
            "m1.small",
            "m1.medium",
            "m1.large",
            "m1.xlarge",
            "m2.xlarge",
            "m2.2xlarge",
            "m2.4xlarge",
            "m3.medium",
            "m3.large",
            "m3.xlarge",
            "m3.2xlarge",
            "c1.medium",
            "c1.xlarge",
            "c3.large",
            "c3.xlarge",
            "c3.2xlarge",
            "c3.4xlarge",
            "c3.8xlarge",
            "g2.2xlarge",
            "r3.large",
            "r3.xlarge",
            "r3.2xlarge",
            "r3.4xlarge",
            "r3.8xlarge",
            "i2.xlarge",
            "i2.2xlarge",
            "i2.4xlarge",
            "i2.8xlarge",
            "hi1.4xlarge",
            "hs1.8xlarge",
            "cr1.8xlarge",
            "cc2.8xlarge",
            "cg1.4xlarge"
         ],
         "ConstraintDescription":"must be a valid EC2 instance type, existing in the mapping."
      },
      "pWebInstanceType":{
         "Description":"WebServer EC2 instance type",
         "Type":"String",
         "Default":"m3.large",
         "AllowedValues":[
            "t1.micro",
            "t2.micro",
            "t2.small",
            "t2.medium",
            "m1.small",
            "m1.medium",
            "m1.large",
            "m1.xlarge",
            "m2.xlarge",
            "m2.2xlarge",
            "m2.4xlarge",
            "m3.medium",
            "m3.large",
            "m3.xlarge",
            "m3.2xlarge",
            "c1.medium",
            "c1.xlarge",
            "c3.large",
            "c3.xlarge",
            "c3.2xlarge",
            "c3.4xlarge",
            "c3.8xlarge",
            "g2.2xlarge",
            "r3.large",
            "r3.xlarge",
            "r3.2xlarge",
            "r3.4xlarge",
            "r3.8xlarge",
            "i2.xlarge",
            "i2.2xlarge",
            "i2.4xlarge",
            "i2.8xlarge",
            "hi1.4xlarge",
            "hs1.8xlarge",
            "cr1.8xlarge",
            "cc2.8xlarge",
            "cg1.4xlarge"
         ],
         "ConstraintDescription":"must be a valid EC2 instance type, existing in the mapping."
      },
      "pAppInstanceType":{
         "Description":"Application Server EC2 instance type",
         "Type":"String",
         "Default":"m3.large",
         "AllowedValues":[
            "t1.micro",
            "t2.micro",
            "t2.small",
            "t2.medium",
            "m1.small",
            "m1.medium",
            "m1.large",
            "m1.xlarge",
            "m2.xlarge",
            "m2.2xlarge",
            "m2.4xlarge",
            "m3.medium",
            "m3.large",
            "m3.xlarge",
            "m3.2xlarge",
            "c1.medium",
            "c1.xlarge",
            "c3.large",
            "c3.xlarge",
            "c3.2xlarge",
            "c3.4xlarge",
            "c3.8xlarge",
            "g2.2xlarge",
            "r3.large",
            "r3.xlarge",
            "r3.2xlarge",
            "r3.4xlarge",
            "r3.8xlarge",
            "i2.xlarge",
            "i2.2xlarge",
            "i2.4xlarge",
            "i2.8xlarge",
            "hi1.4xlarge",
            "hs1.8xlarge",
            "cr1.8xlarge",
            "cc2.8xlarge",
            "cg1.4xlarge"
         ],
         "ConstraintDescription":"must be a valid EC2 instance type, existing in the mapping."
      },
      "pRegionDomain":{
         "Description":"Region name where resources will deploy",
         "Type":"String",
         "Default":"us-east-1.compute.internal"
      },
      "pRegionAZ1Name":{
         "Description":"Availability Zone 1 Name in Region",
         "Type":"AWS::EC2::AvailabilityZone::Name"
      },
      "pRegionAZ2Name":{
         "Description":"Availability Zone 2 Name in Region",
         "Type":"AWS::EC2::AvailabilityZone::Name"
      },
      "pProductionVPCName":{
         "Description":"Production VPC Name",
         "Type":"String",
         "Default":"Production"
      },
      "pDevelopmentVPCName":{
         "Description":"Development VPC Name",
         "Type":"String",
         "Default":"Development"
      },
      "pProductionCIDR":{
         "Description":"CIDR block for Production VPC",
         "Type":"String",
         "Default":"10.100.0.0/16",
         "AllowedPattern":"(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})",
         "ConstraintDescription":"must be a valid IP CIDR range of the form x.x.x.x/x."
      },
      "pDMZSubnetACIDR":{
         "Description":"CIDR block for DMZ AZ-1b subnet",
         "Type":"String",
         "Default":"10.100.1.0/24",
         "AllowedPattern":"(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})",
         "ConstraintDescription":"must be a valid IP CIDR range of the form x.x.x.x/x."
      },
      "pDMZSubnetBCIDR":{
         "Description":"CIDR block for DMZ AZ-1b subnet",
         "Type":"String",
         "Default":"10.100.2.0/24",
         "AllowedPattern":"(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})",
         "ConstraintDescription":"must be a valid IP CIDR range of the form x.x.x.x/x."
      },
      "pAppPrivateSubnetACIDR":{
         "Description":"CIDR block for Public AZ-1a subnet",
         "Type":"String",
         "Default":"10.100.10.0/24",
         "AllowedPattern":"(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})",
         "ConstraintDescription":"must be a valid IP CIDR range of the form x.x.x.x/x."
      },
      "pAppPrivateSubnetBCIDR":{
         "Description":"CIDR block for Public AZ-1b subnet",
         "Type":"String",
         "Default":"10.100.11.0/24",
         "AllowedPattern":"(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})",
         "ConstraintDescription":"must be a valid IP CIDR range of the form x.x.x.x/x."
      },
      "pDBPrivateSubnetACIDR":{
         "Description":"CIDR block for Private AZ-1a subnet",
         "Type":"String",
         "Default":"10.100.20.0/24",
         "AllowedPattern":"(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})",
         "ConstraintDescription":"must be a valid IP CIDR range of the form x.x.x.x/x."
      },
      "pDBPrivateSubnetBCIDR":{
         "Description":"CIDR block for Private AZ-1b subnet",
         "Type":"String",
         "Default":"10.100.21.0/24",
         "AllowedPattern":"(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})",
         "ConstraintDescription":"must be a valid IP CIDR range of the form x.x.x.x/x."
      },
      "pManagementCIDR":{
         "Description":"CIDR block for Management VPC",
         "Type":"String",
         "Default":"10.10.0.0/16",
         "AllowedPattern":"(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})",
         "ConstraintDescription":"must be a valid IP CIDR range of the form x.x.x.x/x."
      },
      "pManagementSubnetACIDR":{
         "Description":"CIDR block for Management AZ-1a subnet",
         "Type":"String",
         "Default":"10.10.1.0/24",
         "AllowedPattern":"(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})",
         "ConstraintDescription":"must be a valid IP CIDR range of the form x.x.x.x/x."
      },
      "pManagementSubnetBCIDR":{
         "Description":"CIDR block for Management AZ-1b subnet",
         "Type":"String",
         "Default":"10.10.2.0/24",
         "AllowedPattern":"(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})",
         "ConstraintDescription":"must be a valid IP CIDR range of the form x.x.x.x/x."
      },
      "pDevelopmentCIDR":{
         "Description":"CIDR block for Development VPC",
         "Type":"String",
         "Default":"10.20.0.0/16",
         "AllowedPattern":"((\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})|False)",
         "ConstraintDescription":"must be a valid IP CIDR range of the form x.x.x.x/x."
      },
      "pDevSubnetACIDR":{
         "Description":"CIDR block for Development AZ-1a subnet",
         "Type":"String",
         "Default":"10.20.1.0/24",
         "AllowedPattern":"(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})",
         "ConstraintDescription":"must be a valid IP CIDR range of the form x.x.x.x/x."
      },
      "pDevSubnetBCIDR":{
         "Description":"CIDR block for Development AZ-1b subnet",
         "Type":"String",
         "Default":"10.20.2.0/24",
         "AllowedPattern":"(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})",
         "ConstraintDescription":"must be a valid IP CIDR range of the form x.x.x.x/x."
      },
      "pWebContentBucketName":{
         "Description":"Name of S3 Bucket to use for web content (optional)",
         "Type":"String",
         "Default":"none"
      },
      "pAppLogsBucketName":{
         "Description":"Name of S3 Bucket to use for application logs (optional)",
         "Type":"String",
         "Default":"none"
      },
      "pBackupBucketName":{
         "Description":"Name of S3 Bucket to use for backup/DR data (optional)",
         "Type":"String",
         "Default":"none"
      },
      "stack1URL":{
         "Description":"Valid S3 URL of location where Stack1 template exists",
         "Type":"String",
         "Default":"https://s3.amazonaws.com/quickstart-reference/enterprise-accelerator/nist/latest/templates/stack1-access-01.json"
      },
      "stack2URL":{
         "Description":"Valid S3 URL of location where Stack2 template exists",
         "Type":"String",
         "Default":"https://s3.amazonaws.com/quickstart-reference/enterprise-accelerator/nist/latest/templates/stack2-network-01.json"
      },
      "stack3URL":{
         "Description":"Valid S3 URL of location where Stack3 template exists",
         "Type":"String",
         "Default":"https://s3.amazonaws.com/quickstart-reference/enterprise-accelerator/nist/latest/templates/stack3-resources-01.json"
      },
      "stack4URL":{
         "Description":"Valid S3 URL of location where Stack4 template exists",
         "Type":"String",
         "Default":"https://s3.amazonaws.com/quickstart-reference/enterprise-accelerator/nist/latest/templates/stack4-application-01.json"
      },
      "pWebServerAMI":{
         "Description":"Which webserver AMI do you want to use, default ",
         "Type":"String",
         "Default":"ami-60b6c60a"
      },
      "pAppAmi":{
         "Description":"Which App AMI do you want to use?",
         "Type":"String",
         "Default":"ami-60b6c60a"
      },
      "pDBName":{
         "Description":"Name of RDS Database",
         "Type":"String",
         "Default":"TestDB"
      },
      "pDBUser":{
         "Description":"Username of RDS DB Instance",
         "Type":"String",
         "Default":"Administrator"
      },
      "pDBPassword":{
         "Description":"*Password of RDS DB Instance (minimum 8 characters)",
         "Type":"String",
         "NoEcho":"True"
      },
      "pDBClass":{
         "Description":"Instance class of RDS instance",
         "Type":"String",
         "Default":"db.m3.large"
      },
      "pDBAllocatedStorage":{
         "Description":"Allocated Storage (in GB) for RDS instance",
         "Type":"String",
         "Default":"10"
      },
      "createVPCManagement":{
         "Description":"Create Management VPC? (yes/no)",
         "Type":"String",
         "Default":"yes"
      },
      "createVPCDevelopment":{
         "Description":"Create Development VPC? (yes/no)",
         "Type":"String",
         "Default":"no"
      }
