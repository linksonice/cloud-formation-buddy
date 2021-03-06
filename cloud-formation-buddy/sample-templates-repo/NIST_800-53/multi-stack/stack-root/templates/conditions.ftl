      "CreateVPCManagement":{
         "Fn::Or":[
            {
               "Fn::Equals":[
                  {
                     "Ref":"createVPCManagement"
                  },
                  "yes"
               ]
            },
            {
               "Fn::Equals":[
                  {
                     "Ref":"createVPCManagement"
                  },
                  "YES"
               ]
            },
            {
               "Fn::Equals":[
                  {
                     "Ref":"createVPCManagement"
                  },
                  "true"
               ]
            },
            {
               "Fn::Equals":[
                  {
                     "Ref":"createVPCManagement"
                  },
                  "True"
               ]
            }
         ]
      },
      "CreateVPCDevelopment":{
         "Fn::Or":[
            {
               "Fn::Equals":[
                  {
                     "Ref":"createVPCDevelopment"
                  },
                  "yes"
               ]
            },
            {
               "Fn::Equals":[
                  {
                     "Ref":"createVPCDevelopment"
                  },
                  "YES"
               ]
            }
         ]
      },
      "CreateWebAppBucket":{
         "Fn::Not":[
            {
               "Fn::Equals":[
                  {
                     "Ref":"pWebContentBucketName"
                  },
                  "none"
               ]
            }
         ]
      },
      "CreateBackupBucket":{
         "Fn::Not":[
            {
               "Fn::Equals":[
                  {
                     "Ref":"pBackupBucketName"
                  },
                  "none"
               ]
            }
         ]
      },
      "CreateAppLogsBucket":{
         "Fn::Not":[
            {
               "Fn::Equals":[
                  {
                     "Ref":"pAppLogsBucketName"
                  },
                  "none"
               ]
            }
         ]
      },
      "CreateStack1":{
         "Fn::Not":[
            {
               "Fn::Equals":[
                  {
                     "Ref":"stack1URL"
                  },
                  ""
               ]
            }
         ]
      },
      "CreateStack2":{
         "Fn::Not":[
            {
               "Fn::Equals":[
                  {
                     "Ref":"stack2URL"
                  },
                  ""
               ]
            }
         ]
      },
      "CreateStack3":{
         "Fn::Not":[
            {
               "Fn::Equals":[
                  {
                     "Ref":"stack3URL"
                  },
                  ""
               ]
            }
         ]
      },
      "CreateStack4":{
         "Fn::Not":[
            {
               "Fn::Equals":[
                  {
                     "Ref":"stack4URL"
                  },
                  ""
               ]
            }
         ]
      }
