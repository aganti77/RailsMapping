# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'spreadsheet'

Location.destroy_all
Spreadsheet.open('db/philadelphia_permits.xls') do |book|
	idExists = []
	book.worksheet('philadelphia_permits').each do |row|
		next if row[0] == 'ID'
  		next if idExists.include?(row[0])
  		idExists << row[0]
  		Location.create(address: "#{row[4]}, PHILADELPHIA, PA",
						permitID: row[0].to_i,
						typeCode: row[2],
						typeName: row[3],
						appDes: row[12],
						dateIssued: row[13],
						status: row[15],
						conName: row[16],
						conAddr1: row[17],
						city: row[19],
						state: row[20],
						zip: row[21])
  	end
end