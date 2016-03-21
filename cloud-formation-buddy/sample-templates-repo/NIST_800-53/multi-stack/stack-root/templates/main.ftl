{
   "AWSTemplateFormatVersion":"${AWSTemplateFormatVersion}",
   "Description":"${description}",
   
   "Metadata":{
   		<#include "metadata.ftl">
   },
   
   "Parameters":{
   		<#include "parameters.ftl">
   },

   "Conditions":{
		<#include "conditions.ftl">
   },
   
   "Resources":{
		<#include "resources.ftl">
   },
   "Outputs":{
   		<#include "outputs.ftl">
   }
}
