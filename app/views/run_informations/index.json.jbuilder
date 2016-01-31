json.run_informations @run_informations do |run_information|
  json.partial! run_information
end
json.count_yotta @count_yotta
json.yotta_run_informations @yotta_run_informations do |yotta_run_information|
  json.partial! yotta_run_information
end
