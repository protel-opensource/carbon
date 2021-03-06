#
# Cookbook Name:: carbon
# Recipe:: carbon_xml
#
# ----------------------------------------------------------------------------
#  Copyright 2005-2014 WSO2, Inc. http://www.wso2.org
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
# ----------------------------------------------------------------------------

#Generate carbon.xml

carbon_xml = "#{node['carbon']['product_path']}/#{node["carbon"]["product_name"]}-#{node["carbon"]["product_version"]}/repository/conf/carbon.xml"

template carbon_xml do
  source 'carbon.xml.erb'
  mode 0644
  owner node["carbon"]["user"]
  group node["carbon"]["group"]
  variables(
	:product_name => node["carbon"]["server_name"],
	:product_version => node["carbon"]["product_version"],
	:server_key => node["carbon"]["server_key"],
	:host_name => node["carbon"]["server_host_name"],
	:server_roles => node["carbon"]["server_roles"],
	:ports_offset => node["carbon"]["server_ports_offset"],
        :axis2_service_path => node["carbon"]["axis2_service_path"],
	:EnableEmailUserName => node["carbon"]["enable_email_user_name"])
end
