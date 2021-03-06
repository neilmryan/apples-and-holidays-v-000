require 'pry'

def second_supply_for_fourth_of_july(hash)
  hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |season, holidays_hash|
		holidays_hash.each do |holiday, supplies|
			if season ==:winter
				supplies << supply
			end
		end
	end

end


def add_supply_to_memorial_day(holiday_hash, supply)
	holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
 		holiday_hash[season] = {holiday_name => supply_array}
 	return holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  	winter_supplies = []
  	holiday_hash.each do |season, holidays_hash|
		    holidays_hash.each do |holiday, supply_array|
			       if season == :winter
			            winter_supplies << supply_array
			       end
		    end
	  end
    return winter_supplies.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holidays_hash|
		season = season.to_s.capitalize!
		puts "#{season}:"
		holidays_hash.each do |holiday, supply_array|
			holiday = holiday.to_s.split("_")
			holiday.each {|i| i.capitalize!}
			puts "  #{holiday.join(" ")}: #{supply_array.join(", ")}"
		end
	end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_array = []
  holiday_hash.each do |season, holidays_hash|
    holidays_hash.each do |holiday, supply_array|
      if supply_array.include?("BBQ")
    	   holiday_array << holiday
    	end
    end
  end
    return holiday_array
end
