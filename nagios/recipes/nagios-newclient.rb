directory '/etc/nagios3/conf.d/hosts.d/utility' do
  action :create
  owner 'root'
  mode '0755'
end

template "/etc/nagios3/conf.d/hosts.d/elk/utility.cfg" do
  source "tata-hosts.erb"
  variables( :a => 'jenkins', :b => "30.0.30.71" )
end

template "/etc/nagios3/conf.d/hosts.d/elk/utility.cfg" do
  source "tata-hosts.erb"
  variables( :c => 'openvpnbastion', :d => "30.0.20.169" )
end

directory '/etc/nagios3/conf.d/hostgroups.d/utility' do
  action :create
  owner 'root'
  mode '0755'
end

template "/etc/nagios3/conf.d/hostgroups.d/elk/utility.cfg" do
  source "tata-hostgroups.erb"
  variables( :e => 'utility', :f => 'jenkins,openvpnbastion' )
end

directory '/etc/nagios3/conf.d/services.d/utility' do
  action :create
  owner 'root'
  mode '0755'
end

template "/etc/nagios3/conf.d/services.d/elk/utility.cfg" do
  source "tata-services.erb"
  variables( :g => 'utility' )
end


service 'nagios3' do
      supports :restart => true, :reload => true
      action :enable
      subscribes :reload, 'template[/etc/nagios3/conf.d/services.d/elk/elk.cfg]', :immediately
end
