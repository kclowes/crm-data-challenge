require 'rspec'
require_relative '../lib/crm_reporter'

describe CrmReporter do

  before do
  end

  it 'returns all of the first names of the people who work there' do
    data = {
      :people => [
        {:first_name => "Whitney"},
        {:first_name => "Elyse"},
      ],
    }
    reporter = CrmReporter.new(data)
    actual = reporter.first_names
    expected = ['Whitney', 'Elyse']
    expect(actual).to eq(expected)
  end

  it 'can return an array of all employments' do
    data = {
      :people => [
        {
          :id => 1,
          first_name: "No",
          last_name: "Job",
          employments: []
        },
        {
          :id => 3,
          :first_name => "Elyse",
          :last_name => "Jensen",
          :employments =>
            [
              {
                :company_id => 4,
                :title => "Chief Communications Consultant"
              },
              {
                :company_id => 7,
                :title => "Mail Jockey"
              }
            ],
        },
        {
          :id => 4,
          :first_name => "Frieda",
          :last_name => "Tess",
          :employments => [
            {
              :company_id => 7,
              :title => "Dynamic Data Specialist"
            }
          ]
        },
      ],
      :companies => [
        {:id => 4, :name => "Acme"},
        {:id => 7, :name => "Galvanize"},
      ]
    }
    reporter = CrmReporter.new(data)
    actual = reporter.employments
    expected = [
      {
        company_id: 4,
        company_name: "Acme",
        person_id: 3,
        person_name: "Elyse Jensen",
        title: "Chief Communications Consultant"
      },
      {
        company_id: 7,
        company_name: "Galvanize",
        person_id: 3,
        person_name: "Elyse Jensen",
        title: "Mail Jockey"
      },
      {
        company_id: 7,
        company_name: "Galvanize",
        person_id: 4,
        person_name: "Frieda Tess",
        title: "Dynamic Data Specialist"
      },
    ]
    expect(actual).to eq(expected)
  end

end