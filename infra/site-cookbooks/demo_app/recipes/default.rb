package 'nodejs'

cookbook_file '/opt/nginx/conf/nginx.conf' do
  source 'nginx.conf'
end


bash 'sync app' do
  code <<-EOH
  if [ -d /opt/nginx/sites/app ]; then
    rm -rf /opt/nginx/sites/app
  fi

  mkdir -p /opt/nginx/sites/app
  cp -R /vagrant/app/* /opt/nginx/sites/app/
  EOH
end

bash 'install bundle' do
  code <<-EOH
  cd /opt/nginx/sites/app
  bundle install --deployment
  EOH
end

bash 'setup db' do
  code <<-EOH
  cd /opt/nginx/sites/app
  rake db:reset
  EOH
end

execute 'start nginx' do
  command '/opt/nginx/sbin/nginx'
end

