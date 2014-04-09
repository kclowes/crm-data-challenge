class CrmReporter
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def first_names
    data[:people].map do |person|
      person[:first_name]
    end
  end

  def employments
    results = []
    data[:people].each do |person|
      if person[:employments] != []
        person[:employments].each do |employment|
          new_person_hash = {}
          new_person_hash[:company_id] = employment[:company_id]
          data[:companies].each do |company|
            if company[:id] == employment[:company_id]
              new_person_hash[:company_name] = company[:name]
            end
          end
          new_person_hash[:person_id] = person[:id]
          new_person_hash[:person_name] = "#{person[:first_name]} #{person[:last_name]}"
          new_person_hash[:title] = employment[:title]
          results << new_person_hash
        end
      end
    end
    results
  end

end