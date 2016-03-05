# cloud-formation-buddy

Large scale CloudFormation templates can quickly become monoliths that are hard to maintain, understand, and reuse (unless you love copying & pasting). 
In addition, long templates make collaboration challenging which goes against best practices in **DevSecOps** where various professionals 
(eg, developers, security engineers, system administrators, DBAs, testers) focus on different subsets of the template based on their expertise.

**cloud-formation-buddy** is a pilot project that leverages the <a href="http://freemarker.incubator.apache.org/">Freemarker</a> template
engine to allow the assembly of cloud formation templates from individual fine-grained meta-templates.

Below is an example of a cloud-formation meta-template (*main.template*) interpreted by *cloud-formation-buddy*. The term meta-template refers to a <a href="http://freemarker.incubator.apache.org/">Freemarker</a> template that will be parsed to produce the final CloudFormation template. The meta-template is written by combining powerful Freemarker syntax along with CloudFormation JSON constructs. 

For instance, the meta-template below contains a directive  `<#include ...>` to include other meta-templates. Hence, meta-templates 
can be edited by different professionals and later combined to form the final CloudFormation template. 

Also, note the presence of variable `${AWSTemplateFormatVersion}` on the freemarker-template. This variable is provided by the user
to *cloud-formation-buddy* and will be resolved in runtime.

By using freemarker-templates *cloud-formation-buddy* fosters *code reuse*, eg, the mappings.template template imported below might come
from a shared repository. The full power of the Freemarker template engine is enabled by *cloud-formation-buddy*. 

Please take some time to familiarize yourself the simple yet powerful <a href="http://freemarker.incubator.apache.org/docs/index.html">Freemarker Template syntax</a>
and start building reusable, maintanable, and readable cloud-formation templates. 

**cloud-formation-buddy** also checks for well-formedness of the generated CloudFormation template. 
After all, we love JSON, right? Maybe not :p

###main.template
```
{
   "AWSTemplateFormatVersion" : "${AWSTemplateFormatVersion}",
   "Description" : "AWS CloudFormation Sample Template VPC_AutoScaling_With_Public_IPs.template: Sample template showing how to create a load balanced, auto scaled group in a VPC where the EC2 instances can directly access the internet. **WARNING** This template creates Elastic Load Balancers and Amazon EC2 instances. You will be billed for the AWS resources used if you create a stack from this template.",
  
   "Parameters" : {
      <#include "parameters.template">
   },  

   "Mappings" : {
      <#include "mappings.template">
   },

   "Resources" : {
      <#include "resources/vpc.template">,    
      <#include "resources/elb.template">,
      <#include "resources/asg.template">,
      <#include "resources/bastion.template">
   },

   "Outputs" : {
      <#include "outputs.template">
   }   
}
```

The *mappings.template* below includes a set of shared meta-templates, eg, *mappings/AWSInstanceType2Arch.template* that can be 
reused by other meta-templates in other template projects.

###mappings.template
```
      "SubnetConfig" : {
			"VPC"     : { "CIDR" : "10.0.0.0/16" },
      		"Public"  : { "CIDR" : "10.0.0.0/24" }
    	},
        
     	<#include "mappings/AWSInstanceType2Arch.template">,
     	<#include "mappings/AWSInstanceType2NATArch.template">,
     	<#include "mappings/AWSRegionArch2AMI.template">
```     	
     	
## Running cloud-formation-buddy
```
java CFNBuddyApp
    -t /home/user/templates/projectA/                       (projectA-specific freemarked-templates) 
    -t /home/user/templates/shared/                         (shared freemarked-templates)
    -o /home/user/templates/projectA/output/                (path to generate final CloudFormation template)
    -v /home/user/templates/projectA/variables.properties   (path to name=value variables file to be used to resolve ${} variables in the template)
```

## Try it out
Find sample meta-templates on the 
<a href="https://github.com/marcilio/cloud-formation-buddy/tree/master/cloud-formation-buddy/sample-templates-repo">sample-templates-repo</a>
folder that you can use to try cloud-formation-buddy.

## Feedback
This is a pilot project. Your feedback is greatly appreciated. 
