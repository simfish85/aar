describe package('git') do
  it { should be_installed }
end

describe directory('/var/www/AAR') do
  it { should exist }
  it { should be_owned_by 'www-data' }
end

describe file('/var/www/AAR/AAR_config.py') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'www-data' }
end
