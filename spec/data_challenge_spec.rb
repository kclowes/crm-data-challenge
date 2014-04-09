require 'rspec'
require_relative '../lib/data_challenge'

describe DataChallenge do
  company_array = [{company: 'Nicholas and Sons',
                    :employees => [
                      {:first_name => 'Shannon',
                       :last_name => 'Sharpe'},
                      {:first_name => 'Peyton',
                       :last_name => 'Manning'},
                      {:first_name => 'Terrell',
                       :last_name => 'Davis'}
                    ]
                   }
  ]
  it 'returns an array of companies and the people who work for them' do
    dc = DataChallenge.new(company_array)
    expected = [{company: 'Nicholas and Sons',
                 :employees => [
                   {:first_name => 'Shannon',
                    :last_name => 'Sharpe'},
                   {:first_name => 'Peyton',
                    :last_name => 'Manning'},
                   {:first_name => 'Terrell',
                    :last_name => 'Davis'}
                 ]
                }
    ]
    expect(dc.original_array).to eq(expected)
  end

  it 'returns all of the first names of the people who work there' do
    dc = DataChallenge.new(company_array)
    #what is a better name for dc?
    actual = dc.first_name
    expected = ['Shannon', 'Peyton', 'Terrell']
    expect(actual).to eq(expected)
  end

  it 'user can add employees to the array' do
    dc = DataChallenge.new(company_array)
    actual = dc.add_employee('Barry', 'Sanders')
    expected = [{company: 'Nicholas and Sons',
                 :employees => [
                   {:first_name => 'Shannon',
                    :last_name => 'Sharpe'},
                   {:first_name => 'Peyton',
                    :last_name => 'Manning'},
                   {:first_name => 'Terrell',
                    :last_name => 'Davis'},
                   {:first_name => 'Barry',
                    :last_name => 'Sanders'}
                 ]
                }
    ]
    expect(actual).to eq(expected)
  end

  it 'user can add a new company to the array' do
    dc = DataChallenge.new(company_array)
    actual = dc.add_company('Dallas Cowboys')
    expected = [{company: 'Nicholas and Sons',
                 :employees => [
                   {:first_name => 'Shannon',
                    :last_name => 'Sharpe'},
                   {:first_name => 'Peyton',
                    :last_name => 'Manning'},
                   {:first_name => 'Terrell',
                    :last_name => 'Davis'},
                   {:first_name => 'Barry',
                    :last_name => 'Sanders'}]},
                {company: 'Dallas Cowboys'}
    ]
    expect(actual).to eq(expected)
  end
  end