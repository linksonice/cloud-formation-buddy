      "stack1":{
         "Type":"AWS::CloudFormation::Stack",
         "Condition":"CreateStack1",
         "Properties":{
            "TemplateURL":{
               "Ref":"stack1URL"
            },
            "TimeoutInMinutes":"20",
            "Parameters":{
               "pNotifyEmail":{
                  "Ref":"pNotifyEmail"
               },
               "pCreateCloudTrail":{
                  "Ref":"pCreateCloudTrail"
               },
               "pS3CloudTrailBucketExisting":{
                  "Ref":"pS3CloudTrailBucketExisting"
               },
               "pS3CloudTrailLocal":{
                  "Ref":"pS3CloudTrailLocal"
               }
            }
         }
      },
      "stack2":{
         "Type":"AWS::CloudFormation::Stack",
         "Condition":"CreateStack2",
         "Properties":{
            "TemplateURL":{
               "Ref":"stack2URL"
            },
            "TimeoutInMinutes":"20",
            "Parameters":{
               "pRegionDomain":{
                  "Ref":"pRegionDomain"
               },
               "pRegionAZ1Name":{
                  "Ref":"pRegionAZ1Name"
               },
               "pRegionAZ2Name":{
                  "Ref":"pRegionAZ2Name"
               },
               "pProductionVPCName":{
                  "Ref":"pProductionVPCName"
               },
               "pDevelopmentVPCName":{
                  "Ref":"pDevelopmentVPCName"
               },
               "pProductionCIDR":{
                  "Ref":"pProductionCIDR"
               },
               "pNatInstanceType":{
                  "Ref":"pNatInstanceType"
               },
               "pDMZSubnetACIDR":{
                  "Ref":"pDMZSubnetACIDR"
               },
               "pDMZSubnetBCIDR":{
                  "Ref":"pDMZSubnetBCIDR"
               },
               "pAppPrivateSubnetACIDR":{
                  "Ref":"pAppPrivateSubnetACIDR"
               },
               "pAppPrivateSubnetBCIDR":{
                  "Ref":"pAppPrivateSubnetBCIDR"
               },
               "pDBPrivateSubnetACIDR":{
                  "Ref":"pDBPrivateSubnetACIDR"
               },
               "pManagementCIDR":{
                  "Fn::If":[
                     "CreateVPCManagement",
                     {
                        "Ref":"pManagementCIDR"
                     },
                     "false"
                  ]
               },
               "pManagementSubnetACIDR":{
                  "Fn::If":[
                     "CreateVPCManagement",
                     {
                        "Ref":"pManagementSubnetACIDR"
                     },
                     "false"
                  ]
               },
               "pManagementSubnetBCIDR":{
                  "Fn::If":[
                     "CreateVPCManagement",
                     {
                        "Ref":"pManagementSubnetBCIDR"
                     },
                     "false"
                  ]
               },
               "pDevelopmentCIDR":{
                  "Fn::If":[
                     "CreateVPCDevelopment",
                     {
                        "Ref":"pDevelopmentCIDR"
                     },
                     "false"
                  ]
               },
               "pDevSubnetACIDR":{
                  "Fn::If":[
                     "CreateVPCDevelopment",
                     {
                        "Ref":"pDevSubnetACIDR"
                     },
                     "false"
                  ]
               },
               "pDevSubnetBCIDR":{
                  "Fn::If":[
                     "CreateVPCDevelopment",
                     {
                        "Ref":"pDevSubnetBCIDR"
                     },
                     "false"
                  ]
               },
               "pKeyName":{
                  "Ref":"pKeyName"
               },
               "pDBPrivateSubnetBCIDR":{
                  "Ref":"pDBPrivateSubnetBCIDR"
               }
            }
         }
      },
      "stack3":{
         "Type":"AWS::CloudFormation::Stack",
         "Condition":"CreateStack3",
         "DependsOn":"stack2",
         "Properties":{
            "TemplateURL":{
               "Ref":"stack3URL"
            },
            "TimeoutInMinutes":"20",
            "Parameters":{
               "pProductionVPC":{
                  "Fn::GetAtt":[
                     "stack2",
                     "Outputs.rVPCProduction"
                  ]
               },
               "pProductionCIDR":{
                  "Ref":"pProductionCIDR"
               },
               "pDMZSubnetA":{
                  "Fn::GetAtt":[
                     "stack2",
                     "Outputs.rDMZSubnetA"
                  ]
               },
               "pDMZSubnetB":{
                  "Fn::GetAtt":[
                     "stack2",
                     "Outputs.rDMZSubnetB"
                  ]
               },
               "pAppPrivateSubnetA":{
                  "Fn::GetAtt":[
                     "stack2",
                     "Outputs.rAppPrivateSubnetA"
                  ]
               },
               "pAppPrivateSubnetB":{
                  "Fn::GetAtt":[
                     "stack2",
                     "Outputs.rAppPrivateSubnetB"
                  ]
               },
               "pS3WebContentBucketName":{
                  "Fn::If":[
                     "CreateWebAppBucket",
                     {
                        "Ref":"pWebContentBucketName"
                     },
                     "false"
                  ]
               },
               "pS3AppLogsBucketName":{
                  "Fn::If":[
                     "CreateAppLogsBucket",
                     {
                        "Ref":"pAppLogsBucketName"
                     },
                     "false"
                  ]
               },
               "pS3BackupBucketName":{
                  "Fn::If":[
                     "CreateBackupBucket",
                     {
                        "Ref":"pBackupBucketName"
                     },
                     "false"
                  ]
               },
               "pVPCManagement":{
                  "Fn::If":[
                     "CreateVPCManagement",
                     {
                        "Fn::GetAtt":[
                           "stack2",
                           "Outputs.rVPCManagement"
                        ]
                     },
                     "false"
                  ]
               }
            }
         }
      },
      "stack4":{
         "Type":"AWS::CloudFormation::Stack",
         "DependsOn":"stack3",
         "Condition":"CreateStack4",
         "Properties":{
            "TemplateURL":{
               "Ref":"stack4URL"
            },
            "TimeoutInMinutes":"30",
            "Parameters":{
               "pProductionVPC":{
                  "Fn::GetAtt":[
                     "stack2",
                     "Outputs.rVPCProduction"
                  ]
               },
               "pProductionCIDR":{
                  "Ref":"pProductionCIDR"
               },
               "pDMZSubnetA":{
                  "Fn::GetAtt":[
                     "stack2",
                     "Outputs.rDMZSubnetA"
                  ]
               },
               "pDMZSubnetB":{
                  "Fn::GetAtt":[
                     "stack2",
                     "Outputs.rDMZSubnetB"
                  ]
               },
               "pDBPrivateSubnetA":{
                  "Fn::GetAtt":[
                     "stack2",
                     "Outputs.rDBPrivateSubnetA"
                  ]
               },
               "pDBPrivateSubnetB":{
                  "Fn::GetAtt":[
                     "stack2",
                     "Outputs.rDBPrivateSubnetB"
                  ]
               },
               "pAppPrivateSubnetA":{
                  "Fn::GetAtt":[
                     "stack2",
                     "Outputs.rAppPrivateSubnetA"
                  ]
               },
               "pAppPrivateSubnetB":{
                  "Fn::GetAtt":[
                     "stack2",
                     "Outputs.rAppPrivateSubnetB"
                  ]
               },
               "pKeyName":{
                  "Ref":"pKeyName"
               },
               "pNatInstanceType":{
                  "Ref":"pNatInstanceType"
               },
               "pRegionAZ1Name":{
                  "Ref":"pRegionAZ1Name"
               },
               "pRegionAZ2Name":{
                  "Ref":"pRegionAZ2Name"
               },
               "pWebInstanceType":{
                  "Ref":"pWebInstanceType"
               },
               "pAppInstanceType":{
                  "Ref":"pAppInstanceType"
               },
               "pSecurityGroupWeb":{
                  "Fn::GetAtt":[
                     "stack3",
                     "Outputs.rSecurityGroupWeb"
                  ]
               },
               "pSecurityGroupApp":{
                  "Fn::GetAtt":[
                     "stack3",
                     "Outputs.rSecurityGroupApp"
                  ]
               },
               "pSecurityGroupMgmtBastionHost":{
                  "Fn::GetAtt":[
                     "stack3",
                     "Outputs.rSecurityGroupMgmtBastionHost"
                  ]
               },
               "pWebServerAMI":{
                  "Ref":"pWebServerAMI"
               },
               "pAppAmi":{
                  "Ref":"pAppAmi"
               },
               "pSecurityGroupRDS":{
                  "Fn::GetAtt":[
                     "stack3",
                     "Outputs.rSecurityGroupRDS"
                  ]
               },
               "pDBName":{
                  "Ref":"pDBName"
               },
               "pDBUser":{
                  "Ref":"pDBUser"
               },
               "pDBPassword":{
                  "Ref":"pDBPassword"
               },
               "pDBClass":{
                  "Ref":"pDBClass"
               },
               "pDBAllocatedStorage":{
                  "Ref":"pDBAllocatedStorage"
               },
               "pManagementSubnetA":{
                  "Fn::If":[
                     "CreateVPCManagement",
                     {
                        "Fn::GetAtt":[
                           "stack2",
                           "Outputs.rManagementSubnetA"
                        ]
                     },
                     "false"
                  ]
               }
            }
         }
      }