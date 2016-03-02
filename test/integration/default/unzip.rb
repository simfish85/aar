describe package('git') do
  it { should be_installed }
end

describe directory('/var/www/AAR') do
  it { should exist }
end
