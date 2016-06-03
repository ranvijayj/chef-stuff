directory '/etc/nagios3/conf.d/hosts.d/elk' do
  action :create
  owner 'root'
  mode '0755'
end

template "/etc/nagios3/conf.d/hosts.d/elk/elk.cfg" do
  source "tata-hosts.erb"
  variables( :a => 'elk', :b => '30.0.30.20' )
end


directory '/etc/nagios3/conf.d/hostgroups.d/elk' do
  action :create
  owner 'root'
  mode '0755'
end

template "/etc/nagios3/conf.d/hostgroups.d/elk/elk.cfg" do
  source "tata-hosts.erb"
  variables( :a => 'elk', :b => 'elk' )
end

directory '/etc/nagios3/conf.d/services.d/elk' do
  action :create
  owner 'root'
  mode '0755'
end

template "/etc/nagios3/conf.d/services.d/elk/elk.cfg" do
  source "tata-services.erb"
  variables( :a => 'elk' )
end


service 'nagios3' do
      supports :restart => true, :reload => true
      action :enable
      subscribes :reload, 'template[/etc/nagios3/conf.d/services.d/elk/elk.cfg]', :immediately
end
